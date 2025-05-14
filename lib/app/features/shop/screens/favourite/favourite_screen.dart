
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/appBar/app_bar.dart';

import '../../../../common/widgets/cards/product_card/circular_icon.dart';
import '../../../../common/widgets/cards/product_card/vertical/product_card_vertical.dart';
import '../../../../common/widgets/layout/grid_layout.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../controllers/product_controller.dart';

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
            child: CCircularIcon(color: dark ? CColors.white : CColors.black, icon: Iconsax.add),
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
              return ProductCardVertical(dark: dark,   imgPath: ProductController.instance.allProducts[index].thumbnail,
                productTitle: ProductController.instance.allProducts[index].description,
                categoryTitle:
                ProductController.instance.allProducts[index].brand!.name,
                price: ProductController.instance.allProducts[index].price,
                discountedPrice:
                ProductController.instance.allProducts[index].salePrice,);
            },
          ),
        ),
      ),
    );
  }
}
