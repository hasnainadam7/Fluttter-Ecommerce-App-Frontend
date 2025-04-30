import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../routes/routes.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        spacing: CSizes.spaceBtwItems / 2,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right),
              labelText: CTexts.email,
            ),
          ),

          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
              labelText: CTexts.password,
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: CSizes.spaceBtwInputFields / 2,
                children: [
                  SizedBox(
                    height: CSizes.md,
                    width: CSizes.md,
                    child: Checkbox(value: true, onChanged: (_) {}),
                  ),
                  const Text(CTexts.rememberMe),
                ],
              ),
              TextButton(
                onPressed: () {
                  Get.toNamed(Routes.forget);
                },
                child: const Text(CTexts.forgetPassword),
              ),
            ],
          ),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.navigator);
              },
              child: const Text(CTexts.signIn),
            ),
          ),

          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                Get.toNamed(Routes.signup);
              },
              child: const Text(CTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
