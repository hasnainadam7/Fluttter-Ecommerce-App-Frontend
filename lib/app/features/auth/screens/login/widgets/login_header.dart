
import 'package:flutter/material.dart';

import '../../../../../utils/constants/images_string.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key, required this.dark});
  final bool dark;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          height: CSizes.imgCarouselHeight,
          dark ? CImages.lightAppLogo : CImages.darkAppLogo,
        ),
        Text(CTexts.loginTitle, style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: CSizes.sm),
        Text(CTexts.loginSubTitle, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}