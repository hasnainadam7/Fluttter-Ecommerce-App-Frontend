import 'package:ecommerceapp/app/common/widgets/appBar/app_bar.dart';
import 'package:ecommerceapp/app/features/personalization/screens/profile/widgets/close_account_button.dart';
import 'package:ecommerceapp/app/features/personalization/screens/profile/widgets/image_upload.dart';
import 'package:ecommerceapp/app/features/personalization/screens/profile/widgets/personal_information.dart';
import 'package:ecommerceapp/app/features/personalization/screens/profile/widgets/profile_information.dart';
import 'package:ecommerceapp/app/utils/constants/sizes.dart';
import 'package:ecommerceapp/app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final List<Map<String, dynamic>> profileInformation = [
    {"title": 'Name', "value": 'Hasnain Adam', "onPressed": () {}},
    {"title": 'Username', "value": 'flutter_dev', "onPressed": () {}},
  ];

  final List<Map<String, dynamic>> personalInformation = [
    {"title": 'User ID', "value": '23567', "icon": Iconsax.copy, "onPressed": () {}},
    {"title": 'E-mail', "value": 'flutter_dev@gmail.com', "onPressed": () {}},
    {"title": 'Phone Number', "value": '+924423353123', "onPressed": () {}},
    {"title": 'Gender', "value": 'Male', "onPressed": () {}},
    {"title": 'Date of Birth', "value": '4 Feb, 2001', "onPressed": () {}},
  ];

  @override
  Widget build(BuildContext context) {
    bool dark = CHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: CAppBar(
        dark: dark,
        title: Text("Profile", style: Theme.of(context).textTheme.headlineMedium),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: CSizes.spaceBtwItems,
            children: [
              //img Section
              const ImageUploadSection(),
              //profile information
              ProfileInformation(dark: dark, profileInformation: profileInformation),
              //personal information
              PersonalInformation(dark: dark, personalInformation: personalInformation),
              //logout btn
              const CloseAccountButton(),
            ],
          ),
        ),
      ),
    );
  }
}







