import 'package:ecommerceapp/app/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerceapp/app/data/repositories/user/user_repository.dart';
import 'package:ecommerceapp/app/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final userRepository = Get.put(UserRepository());
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
    } catch (e) {
      CLoaders.warningSnackBar(
        title: "Data not saved",
        message:
            "Something went wrong while saving your information. You can re-save your data in your profile",
      );
    }
  }
}
