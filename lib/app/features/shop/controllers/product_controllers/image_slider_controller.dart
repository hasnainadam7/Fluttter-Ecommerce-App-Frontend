import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/app/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/sizes.dart';

class ImageSliderController extends GetxController {
  static ImageSliderController get instance {
    if (Get.isRegistered<ImageSliderController>()) {
      return Get.find<ImageSliderController>();
    } else {
      try {
        return Get.put(ImageSliderController());
      } catch (e) {
        rethrow; // ya return null agar null-safe karna hai
      }
    }
  }
  @override
  Future<void> onInit() async {



    super.onInit();
  }
  final RxBool isLoading = false.obs;
  final RxString selectedProductImage = ''.obs;
  List<String> getAllProductImages(ProductModel product) {  // Use Set to add unique images only
    Set<String> images = {};

    // Load thumbnail image
    images.add(product.thumbnail);

    // Assign Thumbnail as Selected Image
    selectedProductImage.value = product.thumbnail;

    // Get all images from the Product Model if not null.
    images.addAll(product.images);
  
    // Get all images from the Product Variations if not null.
    if ( product.productVariations.isNotEmpty) {
      images.addAll(product.productVariations.map((variation) => variation.image));
    }

    return images.toList();}
  void showEnlargedImage(String image) {
    Get.to(
      fullscreenDialog: true,
          () => Dialog.fullscreen(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: CSizes.defaultSpace * 2,
                horizontal: CSizes.defaultSpace,
              ),
              child: CachedNetworkImage(imageUrl: image),
            ),
            const SizedBox(height: CSizes.spaceBtwSections),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 150,
                child: OutlinedButton(
                  onPressed: () => Get.back(),
                  child: const Text('Close'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



  /// Function to save category data to FireStore.
}
