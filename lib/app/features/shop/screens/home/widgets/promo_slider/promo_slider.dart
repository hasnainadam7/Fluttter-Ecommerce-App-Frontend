import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../controllers/home_controller.dart';
import 'carousel_slider.dart';
import 'carousel_slider_dots.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Padding(
      padding: EdgeInsets.all(CSizes.defaultSpace),
      child: Column(
        spacing: CSizes.spaceBtwItems,
        children: [
          CCarouselSlider(controller: controller),
          CCarouselSliderDots(controller: controller),
        ],
      ),
    );
  }
}


