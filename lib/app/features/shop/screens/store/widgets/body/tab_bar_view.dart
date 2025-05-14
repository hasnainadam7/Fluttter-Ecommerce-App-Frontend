import 'package:ecommerceapp/app/common/widgets/layout/grid_layout.dart';
import 'package:ecommerceapp/app/common/widgets/texts/section_heading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../common/widgets/cards/product_card/vertical/product_card_vertical.dart';

import '../../../../../../utils/constants/images_string.dart';
import '../../../../../../utils/constants/sizes.dart';

import '../../../../controllers/product_controller.dart';
import 'brand_show_case.dart';

class CTabBarView extends StatelessWidget {
  const CTabBarView({super.key, required this.tabs, required this.dark});

  final List<Map<String, String>> tabs;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      viewportFraction: 1,
      children:
          tabs.map((tab) {
            return ListView(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),

                  child: Column(
                    children: [
                      BrandShowCase(
                        title: tab['name'] ?? '',

                        dark: dark,
                        images: const [
                          CImages.productImage1,
                          CImages.productImage2,
                          CImages.productImage3,
                        ],
                        titleImage: tab['image'] ?? '',
                      ),
                      CSectionHeading(
                        padding: EdgeInsets.zero,
                        title: "You might like",
                        dark: dark,
                      ),
                      CGridLayout(
                        mainAxisExtent: Get.height * 0.31,
                        padding: EdgeInsets.zero,
                        dark: dark,
                        itemCount: 4,
                        itemBuilder: (_, index) {
                          return ProductCardVertical(
                            dark: dark,
                            imgPath: ProductController.instance.allProducts[index].thumbnail,
                            productTitle: ProductController.instance.allProducts[index].description,
                            categoryTitle:
                                ProductController.instance.allProducts[index].brand!.name,
                            price: ProductController.instance.allProducts[index].price,
                            discountedPrice:
                                ProductController.instance.allProducts[index].salePrice,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
    );
  }
}
