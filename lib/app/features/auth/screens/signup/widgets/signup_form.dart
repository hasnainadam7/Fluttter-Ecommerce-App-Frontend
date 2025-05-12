import 'package:ecommerceapp/app/features/auth/controllers/signup/signup_controller.dart';
import 'package:ecommerceapp/app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key, required this.dark});

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        spacing: CSizes.spaceBtwInputFields,
        children: [
          Row(
            spacing: CSizes.spaceBtwInputFields,
            children: [
              Flexible(
                child: TextFormField(
                  validator: (value) => CValidator.validateEmptyText("First Name", value),
                  controller: controller.firstName,
                  expands: false,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),

                    labelText: CTexts.firstName,
                  ),
                ),
              ),
              Flexible(
                child: TextFormField(
                  validator: (value) => CValidator.validateEmptyText("Last Name", value),
                  controller: controller.lastName,
                  expands: false,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),

                    labelText: CTexts.lastName,
                  ),
                ),
              ),
            ],
          ),
          TextFormField(
            controller: controller.username,
            validator: (value) => CValidator.validateEmptyText("User Name", value),
            expands: false,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.user_edit),

              labelText: CTexts.username,
            ),
          ),
          TextFormField(
            validator: (value) => CValidator.validateEmail(value),
            controller: controller.email,
            expands: false,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.direct),

              labelText: CTexts.email,
            ),
          ),
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => CValidator.validatePhoneNumber(value),
            expands: false,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.call),

              labelText: CTexts.phoneNo,
            ),
          ),
          Obx(
            () => TextFormField(
              controller: controller.password,
              expands: false,
              obscureText: controller.hidePassword.value,
              validator: (value) => CValidator.validatePassword(value),
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: GestureDetector(
                  onTap: () => controller.hidePassword.toggle(),
                  child: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                ),
                labelText: CTexts.password,
              ),
            ),
          ),

          Row(
            spacing: CSizes.spaceBtwItems,
            children: [
              SizedBox(
                height: CSizes.lg,
                width: CSizes.lg,
                child: Obx(
                  () => Checkbox(
                    value: controller.privacyPolicy.value,
                    onChanged: (_) => controller.privacyPolicy.toggle(),
                  ),
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "${CTexts.iAgreeTo} ",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: CTexts.privacyPolicy,
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark ? Colors.white : CColors.primaryColor,
                        decoration: TextDecoration.underline,
                        decorationColor: dark ? Colors.white : CColors.primaryColor,
                      ),
                    ),
                    TextSpan(text: " ${CTexts.and} ", style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                      text: CTexts.termsOfUse,
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark ? Colors.white : CColors.primaryColor,
                        decoration: TextDecoration.underline,
                        decorationColor: dark ? Colors.white : CColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Get.toNamed(Routes.verifyEmail);
                controller.signup();
              },
              child: const Text(CTexts.createAccount),
            ),
          ),
          // TextButton(onPressed: () {}, child: Text(CTexts.forgetPassword)),
        ],
      ),
    );
  }
}
