import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../routes/routes.dart';
import '../../../../utils/constants/images_string.dart';
import '../../../../utils/constants/texts.dart';

class ForgetPasswordController extends GetxController {
  /// Variables

  final localStorage = GetStorage();
  final email = TextEditingController();

  GlobalKey<FormState> forgetFormKey = GlobalKey<FormState>();

  Future<void> forgotPassword(String email) async {
    if (!forgetFormKey.currentState!.validate()) {
      return;
    }
    await AuthenticationRepository.instance.forgotPassword(email);

    Get.offAllNamed(
      Routes.resetPasswordSuccuess,
      arguments: {
        'image': CImages.deliveredEmailIllustration,
        'title': CTexts.changeYourPasswordTitle,
        'subTitle': CTexts.changeYourPasswordSubTitle,
        'onPressed': () => Get.offAllNamed(Routes.login),
        'onPressed2': () => Get.offNamed(Routes.forget),
        'button1Text': CTexts.done,
        'button2Text': CTexts.resendEmail,
      },
    );
  }

  /// Email & Password SignIn
}
