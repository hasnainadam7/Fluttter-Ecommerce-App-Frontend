import 'package:ecommerceapp/app/common/styles/spacing_styles.dart';
import 'package:ecommerceapp/app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../utils/helpers/helper_functions.dart';

class ResetPasswordSuccuessScreen extends StatelessWidget {
  const ResetPasswordSuccuessScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.button2Text,
    required this.onPressed,
    required this.button1Text,
    required this.onPressed2,
  });
  final String image, title, subTitle, button1Text, button2Text;
  final VoidCallback onPressed, onPressed2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: CSpacingStyle.paddingWithAppBarHeight,
        child: Column(
          spacing: CSizes.spaceBtwSections,
          children: [
            Image.asset(image, width: CHelperFunctions.screenWidth() * 0.6),
            Column(
              spacing: CSizes.spaceBtwItems,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                Text(
                  subTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),

            Column(
              spacing: CSizes.spaceBtwItems/2,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onPressed,
                    //     () {
                    //   Get.offAllNamed(Routes.login);
                    // },
                    child: Text(button1Text),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: onPressed2,
                    //     () {
                    //   Get.offAllNamed(Routes.login);
                    // },
                    child: Text(button2Text),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
