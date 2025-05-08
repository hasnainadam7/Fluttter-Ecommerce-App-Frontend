import 'package:ecommerceapp/app/features/auth/controllers/onboarding/onboarding_controller.dart';
import 'package:ecommerceapp/app/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';

class OnboardingDotsIndicator extends StatelessWidget {
  OnboardingDotsIndicator({super.key});

  final instanceOfOnboardingController = OnboardingController.instance;
  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);

    return Positioned(
      left: CSizes.defaultSpace,
      bottom: CDeviceUtils.getBottomNavigationBarHeight() + 40,

      child: SmoothPageIndicator(
        effect: ExpandingDotsEffect(activeDotColor: !dark ? CColors.dark : CColors.light, dotHeight: CSizes.s),

        controller: instanceOfOnboardingController.pageController,
        onDotClicked: instanceOfOnboardingController.dotNavigationClick,
        count: 3,
      ),
    );
  }
}
