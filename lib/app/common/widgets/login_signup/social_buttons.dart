import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/images_string.dart';
import '../../../utils/constants/sizes.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: CSizes.spaceBtwItems,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: CColors.grey),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Image.asset(CImages.google, height: CSizes.iconsMd, width: CSizes.iconsMd),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: CColors.grey),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Image.asset(CImages.facebook, height: CSizes.iconsMd, width: CSizes.iconsMd),
          ),
        ),
      ],
    );
  }
}
