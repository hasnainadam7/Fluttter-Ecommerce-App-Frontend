import 'package:ecommerceapp/app/features/shop/screens/home/home_screen.dart';
import 'package:ecommerceapp/app/features/shop/screens/shop/shop_screen.dart';
import 'package:ecommerceapp/app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  NavigationMenu({super.key});

  final List<Map<String, dynamic>> navigations = [
    {
      'title': 'Home',
      'icon': Iconsax.home,
      'onTap': () {
      },
    },
    {
      'title': 'Store',
      'icon': Iconsax.shop,
      'onTap': () {
      },
    },
    {
      'title': 'Wishlist',
      'icon': Iconsax.heart,
      'onTap': () {
      },
    },
    {
      'title': 'Profile',
      'icon': Iconsax.user,
      'onTap': () {
      },
    },
  ];

  final controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationController>(
      builder: (controller2) {
        return Scaffold(
          bottomNavigationBar: NavigationBar(
            height: CSizes.navigationBarHeight,

            elevation: 0,

            selectedIndex: controller2.selectedIndex.value,
            onDestinationSelected: controller2.changeIndex,
            destinations:
                navigations.map((item) {
                  return NavigationDestination(icon: Icon(item['icon']), label: item['title']);
                }).toList(),
          ),
          body: controller2.screens[controller2.selectedIndex.value],
        );
      },
    );
  }
}

class NavigationController extends GetxController {
  // get NavigationController;
  // final int selectedIndex= 0;
  Rx<int> selectedIndex = 0.obs;
  final List<Widget> screens = [
    const HomeScreen(),
    ShopScreen(),
    Container(color: Colors.yellow),
    Container(color: Colors.blue),
  ];

  void changeIndex(index) {
    selectedIndex.value = index;
    update();
  }
}


