import 'package:ecommerceapp/app/features/shop/controllers/product_controllers/favourites_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import 'circular_icon.dart';

class CFavouriteIcon extends StatelessWidget {
  const CFavouriteIcon({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouriteController());
    return Obx(
      () => GestureDetector(
        onTap: () => controller.toggleFavouriteProduct(id),
        child: CCircularIcon(
          color: controller.isFavourite(id) ? CColors.error : null,
          icon: controller.isFavourite(id) ? Iconsax.heart5 : Iconsax.heart,
        ),
      ),
    );
  }
}
