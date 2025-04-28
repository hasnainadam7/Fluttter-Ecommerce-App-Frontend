import 'package:flutter/material.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../controllers/onboarding_controller.dart';

class OnBoardingSkipButton extends StatelessWidget {
   OnBoardingSkipButton({super.key});
  final instanceOfOnboardingController = OnboardingController.instance;
  @override
  Widget build(BuildContext context) {

    return Positioned(
      top: CDeviceUtils.getAppBarHeight(),
      right: CSizes.defaultSpace,
      child: TextButton(
        onPressed: instanceOfOnboardingController.skipPage,
        child: const Text(CTexts.skip),
      ),
    );
  }
}
