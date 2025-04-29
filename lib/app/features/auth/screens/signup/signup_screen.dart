import 'package:ecommerceapp/app/common/widgets/login_signup/form_divider.dart';
import 'package:ecommerceapp/app/common/widgets/login_signup/social_buttons.dart';
import 'package:ecommerceapp/app/features/auth/screens/signup/widgets/signup_form.dart';
import 'package:ecommerceapp/app/utils/constants/sizes.dart';
import 'package:ecommerceapp/app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/texts.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key, });

  @override
  Widget build(BuildContext context) {
    final bool dark= CHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(CSizes.defaultSpace),
        child: Column(
          spacing: CSizes.spacesBtwSections,
          children: [
            //title
            Text(CTexts.signupTitle, style: Theme.of(context).textTheme.headlineMedium),

            SignupForm(dark: dark),
            FormDivider(dark: dark, text: CTexts.orSignUpWith),
            const SocialButtons(),
          ],
        ),
      ),
    );
  }
}
