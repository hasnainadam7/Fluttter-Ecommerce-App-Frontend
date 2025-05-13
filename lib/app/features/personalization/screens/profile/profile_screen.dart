import 'package:ecommerceapp/app/common/widgets/appBar/app_bar.dart';
import 'package:ecommerceapp/app/features/personalization/controllers/user_controller.dart';
import 'package:ecommerceapp/app/features/personalization/screens/profile/widgets/change_details/change_name.dart';
import 'package:ecommerceapp/app/features/personalization/screens/profile/widgets/close_account_button.dart';
import 'package:ecommerceapp/app/features/personalization/screens/profile/widgets/image_upload.dart';
import 'package:ecommerceapp/app/features/personalization/screens/profile/widgets/personal_information.dart';
import 'package:ecommerceapp/app/features/personalization/screens/profile/widgets/profile_information.dart';
import 'package:ecommerceapp/app/utils/constants/sizes.dart';
import 'package:ecommerceapp/app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController controller = Get.put(UserController());
    final List<Map<String, dynamic>> profileInformation = [
      {
        "title": 'Name',

        "value": Obx(() => buildText(controller.user.value.fullName)),
        "onPressed": () {
          Get.to(ChangeName());
        },
      },
      {
        "title": 'Username',
        "value": Obx(() => buildText(controller.user.value.username)),
        "onPressed": () {},
      },
    ];

    final List<Map<String, dynamic>> personalInformation = [
      {
        "title": 'User ID',
        "value": Obx(() => buildText(controller.user.value.id)),
        "icon": Iconsax.copy,
        "onPressed": () {
          CHelperFunctions.copyToClipboard(controller.user.value.id);
        },
      },
      {
        "title": 'E-mail',
        "value": Obx(() => buildText(controller.user.value.email)),
        "onPressed": () {},
      },
      {
        "title": 'Phone Number',
        "value": Obx(() => buildText(controller.user.value.phoneNumber)),
        "onPressed": () {},
      },
      {"title": 'Gender', "value": buildText('Male'), "onPressed": () {}},
      {"title": 'Date of Birth', "value": buildText('4 Feb, 2001'), "onPressed": () {}},
    ];
    bool dark = CHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: CAppBar(
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
              ProfileInformation(profileInformation: profileInformation, dark: dark),
              //personal information
              PersonalInformation(personalInformation: personalInformation, dark: dark),
              //logout btn
              const CloseAccountButton(),
            ],
          ),
        ),
      ),
    );
  }

  Text buildText(String value) {
    return

      Text(
      value,
      style: Theme.of(Get.context!).textTheme.bodyMedium,
      overflow: TextOverflow.ellipsis,
    );
  }
}
