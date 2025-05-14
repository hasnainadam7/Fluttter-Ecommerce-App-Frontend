import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appBar/app_bar.dart';

import '../../../../../common/widgets/cards/product_card/circular_icon.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/images/rounded_images.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/images_string.dart';
import '../../../../../utils/constants/sizes.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({super.key, required this.dark});

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return CCurvedEdgesWidget(
      child: Container(
        color: dark ? CColors.darkerGrey : CColors.light,
        child: Stack(
          children: [
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(CSizes.productImgRadius * 2),
                child: Center(child: Image.asset(CImages.productImage5)),
              ),
            ),
            Positioned(
              bottom: 30,
              right: 0,
              left: CSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return CRoundedImages(
                      width: 80,
                      backgroundColor: dark ? CColors.dark : CColors.white,
                      border: Border.all(color: CColors.primaryColor),
                      padding: const EdgeInsets.all(CSizes.sm),
                      imgUrl: CImages.productImage3,
                    );
                  },
                  separatorBuilder: (_, _) {
                    return const SizedBox(width: CSizes.spaceBtwItems);
                  },
                  itemCount: 6,
                ),
              ),
            ),
            const CAppBar(

              showBackArrow: true,
              actions: [CCircularIcon( icon: Iconsax.heart5, color: Colors.red,)],
            ),
          ],
        ),
      ),
    );
  }
}