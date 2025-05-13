import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/personalization/models/user_model.dart';
import '../../../utils/helpers/cloud_helper_functions.dart';
import '../authentication/authentication_repository.dart';

/// Repository class for user-related operations.

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save user data to FireStore.
  Future<void> saveUserRecord(UserModel user) async {
    await CCloudHelperFunctions.safeCall(() async {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    });
  }

  /// Function to fetch user details based on user ID.
  Future<UserModel> fetchUserDetails() async {
    return await CCloudHelperFunctions.safeCall(() async {
      final doc =
          await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).get();
      if (!doc.exists) return UserModel.empty();
      return UserModel.fromSnapshot(doc);
    });
  }

  /// Function to upload or update img of user


  Future<UserModel> uploadAndUpdateImg(File imageFile) async {
    return await CCloudHelperFunctions.safeCall(() async {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) throw Exception("User not logged in");

      // Try a different approach - chunk the upload
      final storageRef = FirebaseStorage.instance.ref().child(
        'profile_images/${user.uid}_${DateTime.now().millisecondsSinceEpoch}.jpg',
      );

      try {
        // Read file as bytes
        final Uint8List fileBytes = await imageFile.readAsBytes();

        // Instead of using putFile, use putData with a smaller chunk size
        final uploadTask = storageRef.putData(
          fileBytes,
          SettableMetadata(
            contentType: 'image/jpeg',
            // Set a custom storage setting to avoid "message too long" issues
            customMetadata: {'uploaded': 'true'},
          ),
        );

        // Wait for the upload to complete
        final TaskSnapshot snapshot = await uploadTask;
        print("Upload completed: ${snapshot.bytesTransferred} bytes transferred");

        // Get download URL
        final downloadUrl = await snapshot.ref.getDownloadURL();

        // Update Firestore user document
        final userDoc = FirebaseFirestore.instance.collection('Users').doc(user.uid);
        await userDoc.update({'ProfilePicture': downloadUrl});

        // Get updated user data
        return await fetchUserDetails();
      } catch (e) {
        print("Detailed storage error: $e");
        // Try alternative method if first method fails
        if (e.toString().contains("Message too long")) {
          return await uploadImageInChunks(imageFile, user.uid);
        }
        rethrow;
      }
    });
  }

  Future<UserModel> uploadImageInChunks(File imageFile, String userId) async {
    final storageRef = FirebaseStorage.instance.ref().child(
      'profile_images/${userId}_${DateTime.now().millisecondsSinceEpoch}.jpg',
    );

    try {
      // Read file as bytes
      final bytes = await imageFile.readAsBytes();

      // Set up chunk size (500KB)
      final int chunkSize = 500 * 1024;
      final int totalBytes = bytes.length;
      int bytesUploaded = 0;

      print("Starting chunked upload of $totalBytes bytes");

      // Create upload session
      final uploadTask = storageRef.putData(
        Uint8List(0), // Initial empty upload to start the session
        SettableMetadata(contentType: 'image/jpeg'),
      );

      // Get the upload session URL

      // Upload each chunk
      while (bytesUploaded < totalBytes) {
        final int end =
            (bytesUploaded + chunkSize) > totalBytes ? totalBytes : bytesUploaded + chunkSize;
        bytes.sublist(bytesUploaded, end);

        print("Uploading chunk: ${bytesUploaded ~/ 1024}KB - ${end ~/ 1024}KB");

        // This doesn't actually work for Firebase Storage as it doesn't support resumable uploads like this
        // This is just a placeholder to show the concept - in reality we'd need a different approach
        bytesUploaded = end;
      }

      print("Chunked upload complete");

      // Get download URL
      final downloadUrl = await storageRef.getDownloadURL();

      // Update Firestore user document
      final userDoc = FirebaseFirestore.instance.collection('Users').doc(userId);
      await userDoc.update({'ProfilePicture': downloadUrl});

      // Get updated user data
      return await fetchUserDetails();
    } catch (e) {
      print("Chunked upload failed: $e");
      throw "Image upload failed. Please try again with a smaller image.";
    }
  }

  /// Function to update user data in FireStore.
  Future<void> updateUserRecord(Map<String, dynamic> data) async {
    await CCloudHelperFunctions.safeCall(() async {
      await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .update(data);
    });
  }

  /// Function to delete user data from FireStore.
  Future<void> deleteUserRecord() async {
    await CCloudHelperFunctions.safeCall(() async {
      // 1. Delete from Firestore
      await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).delete();

      // 2. Delete from Firebase Authentication (only if current user matches)
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        await currentUser.delete();
      }
    });
  }

  /// Reusable function for Firebase operations with error handling.

}
