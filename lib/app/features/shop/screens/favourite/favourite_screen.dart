
import 'package:ecommerceapp/app/common/widgets/appBar/app_bar.dart';
import 'package:ecommerceapp/app/common/widgets/layout/grid_layout.dart';
import 'package:ecommerceapp/app/features/shop/screens/home/widgets/product_card_vertical/circular_icon.dart';
import 'package:ecommerceapp/app/utils/constants/colors.dart';
import 'package:ecommerceapp/app/utils/constants/sizes.dart';
import 'package:ecommerceapp/app/utils/helpers/helper_functions.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../navigation_menu.dart';
import '../home/widgets/product_card_vertical/product_card_vertical.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = CHelperFunctions.isDarkMode(context);
    final controller = Get.put(NavigationController());
    return Scaffold(
      appBar: CAppBar(
        title: Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          GestureDetector(
            onTap: () => controller.changeIndex(0),
            child: CCircularIcon(
             color: dark ? CColors.white : CColors.black,


              icon: Iconsax.add,
            ),
          ),
        ],

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: CGridLayout(
            padding: EdgeInsets.zero,
            dark: dark,
            itemCount: 7,
            itemBuilder: (_, index) {
              return ProductCardVertical(dark: dark);
            },
          ),
        ),
      ),
    );
  }
}
