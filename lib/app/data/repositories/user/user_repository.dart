import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/personalization/models/user_model.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../authentication/authentication_repository.dart';

/// Repository class for user-related operations.

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save user data to FireStore.
  Future<void> saveUserRecord(UserModel user) async {
    await safeCall(() async {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    });
  }

  /// Function to fetch user details based on user ID.
  Future<UserModel> fetchUserDetails() async {
    return await safeCall(() async {
      final doc =
          await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).get();
      if (!doc.exists) return UserModel.empty();
      return UserModel.fromSnapshot(doc);
    });
  }

  /// Function to update user data in FireStore.
  Future<void> updateUserRecord(Map<String, dynamic> data) async {
    await safeCall(() async {
      await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .update(data);
    });
  }

  /// Function to delete user data from FireStore.
  Future<void> deleteUserRecord() async {
    await safeCall(() async {
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
  Future<T> safeCall<T>(Future<T> Function() fn) async {
    try {
      return await fn();
    } on FirebaseException catch (e) {
      throw Exception(CFirebaseException(e.code).message);
    } on FormatException catch (_) {
      throw Exception(const CFormatException());
    } on PlatformException catch (e) {
      throw Exception(CPlatformException(e.code).message);
    } catch (e) {
      throw Exception('Something went wrong. Please try again');
    }
  }
}
