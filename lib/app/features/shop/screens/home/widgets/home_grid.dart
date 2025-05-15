import 'package:ecommerceapp/app/common/widgets/shimmer_effect/shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/cards/product_card/vertical/product_card_vertical.dart';
import '../../../../../common/widgets/layout/grid_layout.dart';
import '../../../controllers/product_controllers/product_controller.dart';

class HomeGrid extends StatelessWidget {
  const HomeGrid({super.key, required this.dark});

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return CGridLayout(
      dark: dark,
      itemCount: 4,
      mainAxisExtent: Get.height * 0.3,
      itemBuilder: (_, index) {
        return Obx(() {
          // final data =;
          final data =
              [...ProductController.instance.allProducts]
                ..shuffle()
                ..toSet()
                ..take(4);
          if (ProductController.instance.isLoading.value) {
            return CShimmerEffect(width: Get.width * 0.4, height: Get.height * 0.5);
          } else if (data.isEmpty || index >= data.length) {
            return const SizedBox(); // or a fallback UI
          } else {
            return ProductCardVertical(dark: dark, productModel: data[index]);
          }
        });
      },
    );
  }
}
