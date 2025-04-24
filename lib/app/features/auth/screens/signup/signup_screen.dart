import 'package:ecommerceapp/app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/texts.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(CSizes.defaultSpace),
        child: Column(
          spacing: CSizes.spacesBtwSections,
          children: [
            //title
            Text(CTexts.signupTitle, style: Theme.of(context).textTheme.headlineMedium),

            Form(
              child: Column(
                spacing: CSizes.spaceBtwInputFields,
                children: [
                  Row(
                    spacing: CSizes.spaceBtwInputFields,
                    children: [
                      Flexible(
                        child: TextFormField(
                          expands: false,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Iconsax.user),

                            labelText: CTexts.firstName,
                          ),
                        ),
                      ),
                      Flexible(
                        child: TextFormField(
                          expands: false,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Iconsax.user),

                            labelText: CTexts.lastName,
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextFormField(
                    expands: false,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.user_edit),

                      labelText: CTexts.username,
                    ),
                  ),
                  TextFormField(
                    expands: false,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.direct),

                      labelText: CTexts.email,
                    ),
                  ),
                  TextFormField(
                    expands: false,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.call),

                      labelText: CTexts.phoneNo,
                    ),
                  ),
                  TextFormField(
                    expands: false,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.password_check),
                      suffixIcon:Icon(Iconsax.eye_slash) ,
                      labelText: CTexts.password,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
