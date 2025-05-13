import 'dart:io';

import 'package:ecommerceapp/app/data/repositories/user/user_repository.dart';
import 'package:ecommerceapp/app/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:img_picker/img_picker.dart';

import '../models/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final userRepository = Get.put(UserRepository());
  Rx<UserModel> user = UserModel.empty().obs;
  Rx<bool> loader = false.obs;
  @override
  void onInit() {
    super.onInit();

    fetchUserRecord();
  }

  Future<void> uploadImg() async {
    final ImagePicker picker = ImagePicker();

    // Pick image from gallery
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);


    if (pickedFile != null) {
      final File imageFile = File(pickedFile.path);
      user(await userRepository.uploadAndUpdateImg(imageFile));
      CLoaders.successSnackBar(
        title: "Upload Successful",
        message: "Your profile image has been updated successfully.",
      );
    } else {
      CLoaders.errorSnackBar(
        title: "Upload Cancelled",
        message: "No image was selected from the gallery.",
      );
    }
  }

  Future<void> fetchUserRecord() async {
    try {
      loader.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
      loader.value = false;
    } catch (_) {
      user(UserModel.empty());
    } finally {
      loader.value = false;
    }
  }

  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        /// split name into first name and last name
        final nameParts = UserModel.nameParts(userCredentials.user!.displayName ?? "");
        final username = UserModel.generateUsername(userCredentials.user!.displayName ?? "");

        final user = UserModel(
          id: userCredentials.user!.uid,
          firstName: nameParts.first,
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          username: username,
          email: userCredentials.user!.email ?? "",
          phoneNumber: "",
          profilePicture: '',
        );
        await userRepository.saveUserRecord(user);
      }
    } catch (_) {
      CLoaders.warningSnackBar(
        title: "Data not saved",
        message:
            "Something went wrong while saving your information. You can re-save your data in your profile",
      );
    }
  }
}
