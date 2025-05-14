import 'package:ecommerceapp/app/features/shop/controllers/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/cards/product_card/vertical/product_card_vertical.dart';
import '../../../../../common/widgets/layout/grid_layout.dart';
import '../../../../../common/widgets/shimmer_effect/product_shimmer.dart';
import '../../../controllers/product_controller.dart';

class HomeGrid extends StatelessWidget {
  const HomeGrid({super.key, required this.dark});

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return  CGridLayout(
      dark: dark,
      itemCount: 4,
      mainAxisExtent: Get.height * 0.3,
      itemBuilder: (_, index) {
        if (ProductController.instance.isLoading.value) {
          return CProductShimmer();
        } else {
          return ProductCardVertical(
            dark: dark,
            imgPath: ProductController.instance.allProducts[index].thumbnail,
            productTitle: ProductController.instance.allProducts[index].description,
            categoryTitle: ProductController.instance.allProducts[index].brand!.name,
            price: ProductController.instance.allProducts[index].price,
            discountedPrice: ProductController.instance.allProducts[index].salePrice,
          );
        }
      },
    );
    return Obx(() {
      return CGridLayout(
        dark: dark,
        itemCount: 4,
        mainAxisExtent: Get.height * 0.3,
        itemBuilder: (_, index) {
          if (ProductController.instance.isLoading.value) {
            return CProductShimmer();
          } else {
            return ProductCardVertical(
              dark: dark,
              imgPath: ProductController.instance.allProducts[index].thumbnail,
              productTitle: ProductController.instance.allProducts[index].description,
              categoryTitle: ProductController.instance.allProducts[index].brand!.name,
              price: ProductController.instance.allProducts[index].price,
              discountedPrice: ProductController.instance.allProducts[index].salePrice,
            );
          }
        },
      );
    });
  }
}
