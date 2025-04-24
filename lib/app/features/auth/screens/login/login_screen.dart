import 'package:ecommerceapp/app/features/auth/screens/login/widgets/login_form.dart';
import 'package:ecommerceapp/app/features/auth/screens/login/widgets/login_header.dart';
import 'package:ecommerceapp/app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../../../../common/styles/spacing_styles.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../../utils/helpers/helper_functions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: CSpacingStyle.paddingWithAppBarHeight,

          child: Column(
            spacing: CSizes.spacesBtwSections,
            children: [
              //header
              LoginHeader(dark: dark),
              //Form
              LoginForm(),
              // divider
              FormDivider(dark: dark),
              //social icons
              SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
