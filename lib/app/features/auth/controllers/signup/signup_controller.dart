import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../data/repositories/user/user_repository.dart';
import '../../../../utils/constants/images_string.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';
import '../../../personalization/models/user_model.dart';
import '../../screens/signup/verify_email_screen.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs; // Observable for hiding/showing password
  final privacyPolicy = true.obs; // Observable for privacy policy acceptance

  final email = TextEditingController(); // controller for email input
  final firstName = TextEditingController(); // controller for first name input
  final lastName = TextEditingController(); // controller for last name input
  final phoneNumber = TextEditingController(); // controller for phone number input
  final username = TextEditingController(); // controller for username input
  final password = TextEditingController(); // controller for password input
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>(); // Form Key for form validation

  ///  -- SIGN UP
  Future<void> signup() async {
    try {
      // // Start Loading
      CFullScreenLoader.openLoadingDialog(
        'We are processing your information...',
       CImages.docerAnimation,
      );

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        CFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        // Remove Loader
        CFullScreenLoader.stopLoading();
        return;
      }

      // Privacy Policy Check
      if (!privacyPolicy.value) {
        CLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message:
              'In order to create account, you must have to read & accept the Privacy Policy & Terms of Use.',
        );
        return;
      }

      // Register user in the Firebase Authentication & save user data in the Firebase
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );


      // Save Authenticated user data in the Firebase FireStore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Remove Loader
      CFullScreenLoader.stopLoading();

      // Show Success Message
      CLoaders.successSnackBar(
        title: 'Congratulations',
        message: 'Your account has been created! Verify email to continue.',
      );

      // Move to Verify Email Screen
      // Get.to(() => VerifyEmailScreen());
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e, stackTrace) {
      // Remove Loader
      CFullScreenLoader.stopLoading();

      // Show some Generic Error to user
      CLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());

      // extra checking
      if (kDebugMode) {
        print('Firebase Error: $e');
        print('Stack Trace: $stackTrace');
      }
    }
    // finally {
    //   // Remove Loader
    //   TFullScreenLoader.stopLoading();
    // }
  }
}
