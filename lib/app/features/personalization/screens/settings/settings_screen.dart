import 'package:ecommerceapp/app/common/widgets/appBar/app_bar.dart';
import 'package:ecommerceapp/app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:ecommerceapp/app/common/widgets/texts/section_heading.dart';
import 'package:ecommerceapp/app/features/personalization/screens/settings/widgets/settings_menu_tile.dart';
import 'package:ecommerceapp/app/features/personalization/screens/settings/widgets/user_profile_tile.dart';
import 'package:ecommerceapp/app/routes/routes.dart';
import 'package:ecommerceapp/app/utils/constants/colors.dart';
import 'package:ecommerceapp/app/utils/constants/sizes.dart';
import 'package:ecommerceapp/app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});
  final List<Map<String, dynamic>> appSetting = [
    {
      "icon": Iconsax.document_upload,
      "title": 'Load Data',
      "subTitle": 'Upload Data to your Cloud Firestore',
    },
    {
      "icon": Iconsax.location,
      "title": 'Geolocation',
      "subTitle": 'Set recommendation based on location',
      "trailing": Switch(value: true, onChanged: (value) {}),
    },
    {
      "icon": Iconsax.security_user,
      "title": 'Safe Mode',
      "subTitle": 'Search result is safe for all ages',
      "trailing": Switch(value: false, onChanged: (value) {}),
    },
    {
      "icon": Iconsax.image,
      "title": 'HD image Quality',
      "subTitle": 'Set image quality to be seen',
      "trailing": Switch(value: false, onChanged: (value) {}),
    },
  ];
  final List<Map<String, dynamic>> accountSetting = [
    {
      "icon": Iconsax.safe_home,
      "title": 'My Addresses',
      "subTitle": 'Set shopping addresses',
      // "onTap": () => Get.to(() => const UserAddressScreen()),
    },
    {
      "icon": Iconsax.shopping_cart,
      "title": 'My Cart',
      "subTitle": 'Add, remove products & move to checkout',
    },
    {
      "icon": Iconsax.bag_tick,
      "title": 'My Orders',
      "subTitle": 'In-progress & completed orders',
      // "onTap": () => Get.to(() => const OrderScreen()),
    },
    {
      "icon": Iconsax.bank,
      "title": 'Bank Account',
      "subTitle": 'Withdraw balance to registered bank account',
    },
    {
      "icon": Iconsax.discount_shape,
      "title": 'My Coupons',
      "subTitle": 'List of all discount coupons',
    },
    {
      "icon": Iconsax.notification,
      "title": 'Notifications',
      "subTitle": 'Set any kind of notification message',
    },
    {
      "icon": Iconsax.security_card,
      "title": 'Account Privacy',
      "subTitle": 'Manage data usage & connected accounts',
    },
  ];
  @override
  Widget build(BuildContext context) {
    final bool dark = CHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            CPrimaryHeaderContainer(
              child: Column(
                // spacing: CSizes.spacesBtwSections,
                children: [
                  CAppBar(
                    dark: dark,
                    title: Text(
                      'Account',
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium!.apply(color: CColors.white),
                    ),
                  ),

                  UserProfileTile(onPressed:()=> Get.toNamed(Routes.profile) ,),
                  const SizedBox(height: CSizes.spacesBtwSections),
                  //body
                ],
              ),
            ),

            //body
            Padding(
              padding: const EdgeInsets.all(CSizes.defaultSpace / 2),
              child: Column(
                children: [
                  CSectionHeading(
                    title: "Account Settings",
                    showActionButton: false,
                    dark: dark,
                    padding: EdgeInsets.zero,
                  ),
                  ...accountSetting.map((r) {
                    return SettingsMenuTile(
                      title: r['title'],
                      subTitle: r['subTitle'],
                      icon: r['icon'],
                      onTap:
                          r['onTap'] ??
                          () {}, // can be null, which is okay if SettingsMenuTile handles it
                    );
                  }),
                  const SizedBox(height: CSizes.spaceBtwInputFields),
                  CSectionHeading(
                    title: "App Settings",
                    showActionButton: false,
                    dark: dark,
                    padding: EdgeInsets.zero,
                  ),
                  ...appSetting.map((r) {
                    return SettingsMenuTile(
                      title: r['title'],
                      subTitle: r['subTitle'],
                      icon: r['icon'],
                      trailing: r['trailing'],
                      onTap:
                          r['onTap'] ??
                          () {}, // can be null, which is okay if SettingsMenuTile handles it
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
