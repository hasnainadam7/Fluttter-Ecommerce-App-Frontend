import 'package:ecommerceapp/app/features/auth/controllers/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../routes/routes.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';
import '../../../../../utils/validators/validation.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Column(
        spacing: CSizes.spaceBtwItems / 2,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            validator: (value) => CValidator.validateEmail(value),
            controller: controller.email,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right),
              labelText: CTexts.email,
            ),
          ),
          Obx(
            () => TextFormField(
              validator: (value) => CValidator.validatePassword(value),
              obscureText: controller.hidePassword.value,
              controller: controller.password,
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: GestureDetector(
                  onTap: () => controller.hidePassword.toggle(),
                  child: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                ),
                labelText: CTexts.password,
              ),
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
                    child: Obx(
                      () => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (_) => controller.rememberMe.toggle(),
                      ),
                    ),
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
                controller.emailAndPasswordSignIn();
                // Get.toNamed(Routes.navigator);
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
