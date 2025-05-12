import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/images_string.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';
import '../../../personalization/controllers/user_controller.dart';

class LoginController extends GetxController {
  /// Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    email.text = email.text = (localStorage.read('REMEMBER_ME_EMAIL') ?? '') as String;
    password.text = password.text = (localStorage.read('REMEMBER_ME_PASSWORD') ?? '') as String;
    super.onInit();
  }

  /// Email & Password SignIn
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start Loading
      CFullScreenLoader.openLoadingDialog('Logging you in...', CImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        CLoaders.warningSnackBar(
          title: 'No Internet Connection',
          message: "Please check your internet connection",
        );
        CFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        CFullScreenLoader.stopLoading();
        return;
      }

      // Save Data if Remember Me is selected

      // Login user using Email & Password Authentication
      final credentials = await AuthenticationRepository.instance.loginWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );
      if (credentials.user != null) {
        if (rememberMe.value) {
          localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
          localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
        } else {
          localStorage.remove('REMEMBER_ME_EMAIL');
          localStorage.remove('REMEMBER_ME_PASSWORD');
        }
      }

      // Remove Loader
      CFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      CFullScreenLoader.stopLoading();
      CLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  Future<void> googleSignIn() async {
    try {
      // Start Loading
      CFullScreenLoader.openLoadingDialog('Logging you in...', CImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        CLoaders.warningSnackBar(
          title: 'No Internet Connection',
          message: "Please check your internet connection",
        );
        CFullScreenLoader.stopLoading();
        return;
      }


      // Login user using Email & Password Authentication
      final userCredentials = await AuthenticationRepository.instance.loginWithGoogle();

      // SaveUser
      userController.saveUserRecord(userCredentials);

      // Remove Loader
      CFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();


    } catch (e) {
      CFullScreenLoader.stopLoading();
      CLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
