import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/sucess_screen/sucess_screen.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/images_string.dart';
import '../../../../utils/constants/texts.dart';
import '../../../../utils/popups/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  /// Send Email Whenever Verify Screen appears & Set Timer for auto redirect.
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  /// Send Email Verification Link
  Future<void> sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      CLoaders.successSnackBar(
        title: 'Email Sent',
        message: 'Please Check your inbox & verify your email.',
      );
    } catch (e) {
      CLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// Timer to automatically redirect on Email Verification
  void setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(
          () => SucessScreen(
            image: CImages.successfullyRegisterAnimation,
            title: CTexts.yourAccountCreatedTitle,
            subTitle: CTexts.yourAccountCreatedSubTitle,
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
            btnText: CTexts.tContinue,
          ),
        );
      }
    });
  }

  /// Manually Check if Email Verified
  Future<void> checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
        () => SucessScreen(
          image: CImages.staticSuccessIllustration,
          title: CTexts.yourAccountCreatedTitle,
          subTitle: CTexts.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          btnText: CTexts.tContinue,
        ),
      );
    }
  }
}
