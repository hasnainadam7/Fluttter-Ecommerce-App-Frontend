import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/app/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appBar/app_bar.dart';

import '../../../../../common/widgets/cards/product_card/circular_icon.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/images/rounded_images.dart';
import '../../../../../common/widgets/shimmer_effect/shimmer_effect.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/product_controllers/image_slider_controller.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({super.key, required this.dark, required this.product});

  final bool dark;
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final ImageSliderController controller = Get.put(ImageSliderController());
    final List<String> sliderImages = controller.getAllProductImages(product);

    return CCurvedEdgesWidget(
      child: Container(
        color: dark ? CColors.darkerGrey : CColors.light,
        child: Stack(
          children: [
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(CSizes.productImgRadius * 2),
                child: Center(
                  child: Obx(
                    () => GestureDetector(
                      onTap:()=> controller.showEnlargedImage(controller.selectedProductImage.value),
                      child: CachedNetworkImage(
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                const CShimmerEffect(width: double.infinity, radius: 0),
                        fit: BoxFit.contain,
                        imageUrl: controller.selectedProductImage.value,
                      ),
                    ),
                  ),
                ),
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
                    return Obx(() {
                      final bool selectedImage =
                          controller.selectedProductImage.value == sliderImages[index];
                      return CRoundedImages(
                        onPressed: ()=> controller.selectedProductImage.value =sliderImages[index],
                        width: 80,
                        isNetworkImage: true,
                        backgroundColor: dark ? CColors.dark : CColors.white,
                        border: Border.all(color: selectedImage ? CColors.primaryColor : Colors.transparent),
                        padding: const EdgeInsets.all(CSizes.sm),
                        imgUrl: sliderImages[index],
                      );
                    });
                  },
                  separatorBuilder: (_, _) {
                    return const SizedBox(width: CSizes.spaceBtwItems);
                  },
                  itemCount: sliderImages.length,
                ),
              ),
            ),
            const CAppBar(
              showBackArrow: true,
              actions: [CCircularIcon(icon: Iconsax.heart5, color: Colors.red)],
            ),
          ],
        ),
      ),
    );
  }
}
