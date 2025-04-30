
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../controllers/home_controller.dart';

class CCarouselSliderDots extends StatelessWidget {
  const CCarouselSliderDots({
    super.key,
    required this.controller, required this.dark,
  });
  final bool dark;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: CSizes.spaceBtwItems / 2,
      children: List.generate(3, (r) {
        return Obx(
              () => CCircularContainer(
            width: 20,
            height: 4,
            backgroundColor:
            r == controller.carouselCurrentIndex.value
                ? CColors.primaryColor
                : CColors.grey,
          ),
        );
      }),
    );
  }
}