import 'package:ecommerceapp/app/utils/routes/app_routes.dart';
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
    return Form(
      child: Column(
        spacing: CSizes.spaceBtwInputFields,
        children: [
          Row(
            spacing: CSizes.spaceBtwInputFields,
            children: [
              Flexible(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),

                    labelText: CTexts.firstName,
                  ),
                ),
              ),
              Flexible(
                child: TextFormField(
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
            expands: false,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.user_edit),

              labelText: CTexts.username,
            ),
          ),
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.direct),

              labelText: CTexts.email,
            ),
          ),
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.call),

              labelText: CTexts.phoneNo,
            ),
          ),
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
              labelText: CTexts.password,
            ),
          ),
          Row(
            spacing: CSizes.spaceBtwItems,
            children: [
              SizedBox(
                height: CSizes.lg,
                width: CSizes.lg,
                child: Checkbox(value: true, onChanged: (r) {}),
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
                Get.toNamed(Routes.verifyEmail);
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
