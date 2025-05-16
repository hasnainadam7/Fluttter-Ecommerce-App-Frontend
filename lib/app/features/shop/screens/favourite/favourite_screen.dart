import 'package:ecommerceapp/app/common/widgets/loaders/animation_loader.dart';
import 'package:ecommerceapp/app/common/widgets/shimmer_effect/shimmer_effect.dart';
import 'package:ecommerceapp/app/features/shop/controllers/product_controllers/favourites_controller.dart';
import 'package:ecommerceapp/app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/appBar/app_bar.dart';

import '../../../../common/widgets/cards/product_card/circular_icon.dart';
import '../../../../common/widgets/cards/product_card/vertical/product_card_vertical.dart';
import '../../../../common/widgets/layout/grid_layout.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/images_string.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = CHelperFunctions.isDarkMode(context);
    final navigationController = Get.put(NavigationController());
    final favouriteController = FavouriteController.instance;
    return Scaffold(
      appBar: CAppBar(
        title: Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          GestureDetector(
            onTap: () => navigationController.changeIndex(0),
            child: CCircularIcon(color: dark ? CColors.white : CColors.black, icon: Iconsax.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: FutureBuilder(
            future: favouriteController.favouriteProducts(),
            builder: (context, snapshot) {
              var loader = CShimmerEffect(width: Get.width / 2.3);
              final nothingFound = CAnimationLoaderWidget(
                text: "Whoops! Wishlist is Empty...",
                animation: CImages.pencilAnimation,
                showAction: true,
                actionText: 'Let\'s add some',
                onActionPressed: () => navigationController.changeIndex(0),
              );
              var widget = CCloudHelperFunctions.checkMultiRecordState(
                snapshot: snapshot,
                loader: loader,
                nothingFound: nothingFound,
              );

              if (widget != null) return widget;
              final products = snapshot.data!;
              return CGridLayout(
                padding: EdgeInsets.zero,
                dark: dark,
                itemCount: products.length,
                itemBuilder: (_, index) {
                  print(products[index].title);
                  return ProductCardVertical(
                    dark: dark,
                    productModel: products[index],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
