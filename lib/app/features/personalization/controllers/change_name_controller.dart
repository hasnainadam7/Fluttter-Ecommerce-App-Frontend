import 'package:ecommerceapp/app/features/personalization/controllers/user_controller.dart';
import 'package:ecommerceapp/app/features/personalization/models/user_model.dart';
import 'package:ecommerceapp/app/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/repositories/user/user_repository.dart';
import '../../../utils/constants/images_string.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/loaders.dart';

class ChangeNameController extends GetxController {
  static ChangeNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();
  final userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    super.onInit();
    intializeNames();
  }

  Future<void> intializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      CFullScreenLoader.openLoadingDialog(
        "We are updating your information...",
        CImages.docerAnimation,
      );
      // Check Internet Connectivity
      final bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        CLoaders.warningSnackBar(
          title: 'No Internet Connection',
          message: "Please check your internet connection",
        );
        CFullScreenLoader.stopLoading();
        return;
      }
      if( updateUserNameFormKey.currentState!.validate() ){
        CFullScreenLoader.stopLoading();
        return;
      }
      UserModel updatedUser = userController.user.value.copyWith(firstName:  firstName.text, lastName:   lastName.text);
     await userRepository.updateUserRecord(updatedUser.toJson());
      CFullScreenLoader.stopLoading();

    } catch (e) {}
  }

  // Future<void> changeName(){
  //   userRepository.
  // }
}
