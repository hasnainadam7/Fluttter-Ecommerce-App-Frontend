import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class CProductShimmer extends StatelessWidget {
  const CProductShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.65,
        mainAxisSpacing: CSizes.gridViewSpacing,
        crossAxisSpacing: CSizes.gridViewSpacing,
        mainAxisExtent: Get.height*0.5,
      ),
      itemCount: 4, // Show 4 shimmer items while loading
      itemBuilder:
          (_, __) => Container(
            width: 390,
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(CSizes.productImgRadius),
              color: dark ? CColors.darkerGrey : CColors.white,
            ),
            child: Shimmer.fromColors(
              baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!,
              highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  // Image container shimmer
                  Container(
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(CSizes.productImgRadius),
                    ),
                  ),
                  const SizedBox(height: CSizes.spaceBtwItems),
                  // Title shimmer
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: CSizes.sm),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(width: double.infinity, height: 12, color: Colors.white),
                        const SizedBox(height: CSizes.spaceBtwItems / 2),
                        // Brand shimmer
                        Container(width: 100, height: 10, color: Colors.white),
                        const SizedBox(height: CSizes.spaceBtwItems),
                        // Price and cart button shimmer
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(width: 60, height: 15, color: Colors.white),
                            Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
