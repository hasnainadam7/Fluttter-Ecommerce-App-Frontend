import 'package:ecommerceapp/app/utils/helpers/helper_functions.dart';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../controllers/onboarding_controller.dart';



class OnboardingNextButton extends StatelessWidget {
  OnboardingNextButton({super.key});
  final instanceOfOnboardingController = OnboardingController.instance;
  @override
  Widget build(BuildContext context) {

    final dark = CHelperFunctions.isDarkMode(context);

    return Positioned(
      right: CSizes.defaultSpace,
      bottom: CDeviceUtils.getBottomNavigationBarHeight() + 25,

      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: dark ? CColors.primaryColor : CColors.dark,
          shape: const CircleBorder(),
        ),
        onPressed: instanceOfOnboardingController.nextPage,
        child: const Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}
