import 'package:ecommerceapp/app/features/personalization/screens/settings/settings_screen.dart';
import 'package:ecommerceapp/app/features/shop/screens/favourite/favourite_screen.dart';
import 'package:ecommerceapp/app/utils/constants/colors.dart';
import 'package:ecommerceapp/app/utils/constants/sizes.dart';
import 'package:ecommerceapp/app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart'
    show
        BuildContext,
        Colors,
        Icon,
        NavigationBar,
        NavigationDestination,
        Scaffold,
        StatelessWidget,
        Widget;
import 'package:get/get.dart' show Get, GetxController, Inst, IntExtension, Obx, Rx;
import 'package:iconsax/iconsax.dart' show Iconsax;

import 'features/shop/controllers/category_controller.dart';
import 'features/shop/controllers/product_controllers/product_controller.dart';
import 'features/shop/screens/home/home_screen.dart';
import 'features/shop/screens/store/shop_screen.dart' show ShopScreen;

class NavigationMenu extends StatelessWidget {
  NavigationMenu({super.key});

  final List<Map<String, dynamic>> navigation = [
    {'title': 'Home', 'icon': Iconsax.home, 'onTap': () {}},
    {'title': 'Store', 'icon': Iconsax.shop, 'onTap': () {}},
    {'title': 'Wishlist', 'icon': Iconsax.heart, 'onTap': () {}},
    {'title': 'Profile', 'icon': Iconsax.user, 'onTap': () {}},
  ];

  final controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    Get.put(CategoryController());
    Get.put(ProductController());
    bool dark = CHelperFunctions.isDarkMode(context);
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: NavigationBar(
          height: CSizes.navigationBarHeight,

          elevation: 2,
          backgroundColor: dark ? CColors.black : CColors.white,

          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: controller.changeIndex,
          destinations:
              navigation.map((item) {
                return NavigationDestination(icon: Icon(item['icon']), label: item['title']);
              }).toList(),
        ),
        body: controller.screens[controller.selectedIndex.value],
      ),
    );
  }
}

class NavigationController extends GetxController {
  Rx<int> selectedIndex = 0.obs;
  final List<Widget> screens = [
    const HomeScreen(),
    const ShopScreen(),
    const FavouriteScreen(),
    SettingsScreen(),
  ];

  void changeIndex(index) {
    selectedIndex.value = index;
    update();
  }
}
