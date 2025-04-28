import 'package:ecommerceapp/app/utils/constants/sizes.dart';
import 'package:ecommerceapp/app/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/images_string.dart';
import '../../../../utils/routes/app_routes.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(CSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: CSizes.spacesBtwSections,
          children: [
            Column(
              spacing: CSizes.spaceBtwItems,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(CTexts.forgetPasswordTitle, style: Theme.of(context).textTheme.headlineMedium),
                Text(CTexts.forgetPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium),
              ],
            ),
            const SizedBox(height: CSizes.spacesBtwSections),
            TextFormField(
              decoration: const InputDecoration(
                labelText: CTexts.email,
                prefixIcon: Icon(Iconsax.direct_right),
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.offAllNamed(
                    Routes.resetPasswordSuccuess,
                    arguments: {
                      'image': CImages.deliveredEmailIllustration,
                      'title': CTexts.changeYourPasswordTitle,
                      'subTitle': CTexts.changeYourPasswordSubTitle,
                      'onPressed': () => Get.offAllNamed(Routes.login),
                      'onPressed2': () => Get.offAllNamed(Routes.login),
                      'button1Text': CTexts.done,
                      'button2Text': CTexts.resendEmail,
                    },
                  );
                },
                child: const Text(CTexts.submit),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
