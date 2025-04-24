import 'package:flutter/material.dart';

import '../../../../../common/styles/spacing_styles.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class OnBoardingPage extends StatelessWidget {
  final String imgPath, mainTitle, subTitle;
  const OnBoardingPage({super.key, required this.imgPath, required this.mainTitle, required this.subTitle});

  @override
  Widget  build(BuildContext context) {
    return Padding(
      padding: CSpacingStyle.paddingWithAppBarHeight,
      child: Column(
        children: [
          Image.asset(imgPath, height: CHelperFunctions.screenHeight() * 0.6, width: CHelperFunctions.screenWidth() * 0.8),

          Text(mainTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
          const SizedBox(height: CSizes.spaceBtwItems),
          Text(subTitle, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
