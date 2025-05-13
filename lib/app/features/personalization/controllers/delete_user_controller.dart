import 'package:ecommerceapp/app/features/auth/screens/login/login_screen.dart';
import 'package:get/get.dart';

import '../../../data/repositories/user/user_repository.dart';
import '../../../utils/constants/images_string.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';

class DeleteUserController extends GetxController {
  static DeleteUserController get instance => Get.find();
  UserRepository userRepository = Get.put(UserRepository());
  Future<void> deleteUser() async {
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

      await userRepository.deleteUserRecord();
      CFullScreenLoader.stopLoading();
      Get.offAll(LoginScreen());
      CLoaders.customToast(message: "We're sad to see you go. 😢 Your account has been deleted.");
    } catch (_) {}
  }
}
