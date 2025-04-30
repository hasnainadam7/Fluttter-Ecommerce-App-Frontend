import 'package:ecommerceapp/app/utils/constants/images_string.dart';
import 'package:ecommerceapp/app/utils/constants/texts.dart';
import 'package:ecommerceapp/app/utils/helpers/helper_functions.dart';
import 'package:ecommerceapp/app/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/sizes.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Get.offAllNamed(Routes.login);
            },
            icon: const Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(CSizes.defaultSpace),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          spacing: CSizes.spacesBtwSections,
          children: [
            Image.asset(
              CImages.deliveredEmailIllustration,
              width: CHelperFunctions.screenWidth() * 0.6,
            ),
            Column(
              spacing: CSizes.spaceBtwItems,
              children: [
                Text(
                  CTexts.confirmEmail,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                Text(
                  CTexts.supportEmail,
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center,
                ),
                Text(
                  CTexts.confirmEmailSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              spacing: CSizes.spaceBtwItems,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.offAllNamed(
                        Routes.succuessScreen,
                        arguments: {
                          'image':   CImages.staticSuccessIllustration,
                          'title': CTexts.yourAccountCreatedTitle,
                          'subTitle': CTexts.yourAccountCreatedSubTitle,
                          'onPressed': ()=>Get.offAllNamed(Routes.login),
                          // 'onPressed2': ()=>Get.offAllNamed(Routes.login),
                          'btnText':CTexts.tContinue
                        },
                      );
                    },
                    child: const Text(CTexts.tContinue),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(onPressed: () {}, child: const Text(CTexts.resendEmail)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
