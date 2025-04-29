import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/layout/grid_layout.dart';
import 'product_card_vertical/product_card_vertical.dart';

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
        return ProductCardVertical(dark: dark);
      },
    );
  }
}
