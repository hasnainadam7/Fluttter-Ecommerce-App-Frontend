import 'package:ecommerceapp/app/utils/constants/sizes.dart';
import 'package:ecommerceapp/app/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/validators/validation.dart';
import '../../controllers/forget_password/forget_password_controller.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(CSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: CSizes.spaceBtwSections,
          children: [
            Column(
              spacing: CSizes.spaceBtwItems,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(CTexts.forgetPasswordTitle, style: Theme.of(context).textTheme.headlineMedium),
                Text(CTexts.forgetPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium),
              ],
            ),
            const SizedBox(height: CSizes.spaceBtwSections),
            Form(
              key: controller.forgetFormKey,
              child: TextFormField(
                controller: emailController,
                validator: (value) => CValidator.validateEmail(value),
                decoration: const InputDecoration(
                  labelText: CTexts.email,
                  prefixIcon: Icon(Iconsax.direct_right),
                ),
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  controller.forgotPassword(emailController.text.trim());
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
