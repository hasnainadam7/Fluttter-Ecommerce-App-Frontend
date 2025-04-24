import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/images_string.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';
import '../../../../../utils/routes/app_routes.dart';

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
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right),
              labelText: CTexts.email,
            ),
          ),

          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
              labelText: CTexts.password,
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [Checkbox(value: true, onChanged: (_) {}), const Text(CTexts.rememberMe)],
              ),
              TextButton(onPressed: () {}, child: Text(CTexts.forgetPassword)),
            ],
          ),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(onPressed: () {}, child: Text(CTexts.signIn)),
          ),

          SizedBox(
            width: double.infinity,
            child: OutlinedButton(onPressed: () {
              Get.toNamed(AppRoutes.signup);

            }, child: Text(CTexts.createAccount)),
          ),
        ],
      ),
    );
  }
}