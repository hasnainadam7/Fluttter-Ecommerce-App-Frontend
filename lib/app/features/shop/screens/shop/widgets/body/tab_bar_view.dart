import 'package:ecommerceapp/app/common/widgets/layout/grid_layout.dart';
import 'package:ecommerceapp/app/common/widgets/texts/section_heading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../utils/constants/images_string.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../home/widgets/product_card_vertical/product_card_vertical.dart';
import 'brand_show_case.dart';

class CTabBarView extends StatelessWidget {
  const CTabBarView({super.key, required this.tabs, required this.dark});

  final List<String> tabs;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      viewportFraction: 1,
      children:
          tabs.map((tab) {
            return ListView(
              shrinkWrap: true,
              physics:  const ClampingScrollPhysics(),
              children: [
                Padding(

                  padding: const EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),

                  child: Column(
                    children: [
                      BrandShowCase(
                        dark: dark,
                        images: const [
                          CImages.productImage1,
                          CImages.productImage2,
                          CImages.productImage3,
                        ],
                      ),
                      CSectionHeading(
                        padding: EdgeInsets.zero,
                        title: "You might like",
                        dark: dark,
                      ),
                      CGridLayout(
                        mainAxisExtent: Get.height* 0.31,
                        padding: EdgeInsets.zero,
                        dark: dark,
                        itemCount: 4,
                        itemBuilder: (_, index) {
                          return ProductCardVertical(dark: dark);
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
