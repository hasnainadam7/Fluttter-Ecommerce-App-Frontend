import 'package:ecommerceapp/app/common/widgets/shimmer_effect/shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../controllers/banner_controller.dart';
import 'carousel_slider.dart';
import 'carousel_slider_dots.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({super.key, required this.dark});
  final bool dark;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());

    return Padding(
      padding: const EdgeInsets.all(CSizes.defaultSpace),
      child: Obx(
            () {
          if (controller.isLoading.value) {
            return CShimmerEffect(width: double.infinity,height: Get.height*0.15,);
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CCarouselSlider(dark: dark),
                const SizedBox(height: CSizes.spaceBtwItems),
                CCarouselSliderDots(dark: dark),
              ],
            );
          }
        },
      ),
    );
  }
}
