
import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../styles/spacing_styles.dart' ;

class SucessScreen extends StatelessWidget {
  const SucessScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.onPressed, required this.btnText,

  });
  final String image, title, subTitle,btnText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: CSpacingStyle.paddingWithAppBarHeight,
        child: Column(
          spacing: CSizes.spacesBtwSections,
          children: [
            Image.asset(

              image,

              width: CHelperFunctions.screenWidth() * 0.6,
            ),
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

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed:
                    onPressed,
                //     () {
                //   Get.offAllNamed(Routes.login);
                // },
                child: Text(btnText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
