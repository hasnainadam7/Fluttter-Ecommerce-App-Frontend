import 'package:ecommerceapp/app/features/auth/controllers/onboarding_controller.dart';
import 'package:ecommerceapp/app/features/auth/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:ecommerceapp/app/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/images_string.dart';
import 'widgets/onboarding_dot_indicator.dart';

import 'widgets/onboarding_scrollable_pages.dart';
import 'widgets/onboarding_skip_button.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final onBoardingController = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //horizontal scrollable page
          PageView(
            onPageChanged: onBoardingController.updatePageIndicator,
            controller: onBoardingController.pageController,
            children: const [
              OnBoardingPage(imgPath: CImages.onBoardingImage1, mainTitle: CTexts.onBoardingTitle1, subTitle: CTexts.onBoardingSubTitle1),
              OnBoardingPage(imgPath: CImages.onBoardingImage2, mainTitle: CTexts.onBoardingTitle2, subTitle: CTexts.onBoardingSubTitle1),
              OnBoardingPage(imgPath: CImages.onBoardingImage3, mainTitle: CTexts.onBoardingTitle3, subTitle: CTexts.onBoardingSubTitle1),
            ],
          ),
          //skip button
           OnBoardingSkipButton(),
          OnboardingDotsIndicator(),
          OnboardingNextButton(),
        ],
      ),
    );
  }
}
