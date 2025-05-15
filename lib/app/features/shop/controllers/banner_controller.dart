import 'package:ecommerceapp/app/data/repositories/shop/banner_repository.dart';
import 'package:ecommerceapp/app/features/shop/models/promo_banner_model.dart';
import 'package:get/get.dart';

import '../../../utils/popups/loaders.dart';

class BannerController extends GetxController {
  static BannerController get instance {
    if (Get.isRegistered<BannerController>()) {
      return Get.find<BannerController>();
    } else {
      try {
        return Get.put(BannerController());
      } catch (e) {
        // fail silently or return null
        rethrow; // ya return null agar null-safe karna hai
      }
    }
  }
  final RxInt carouselCurrentIndex = 0.obs;
  final RxBool isLoading = false.obs;
  final BannerRepository _bannerRepository = Get.put(BannerRepository());
  final RxList<PromoBannerModel> allPromoBanners = <PromoBannerModel>[].obs;
  void updateCarouselIndex(index) {
    carouselCurrentIndex.value = index;
    update();
  }

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  /// Function to save category data to FireStore.
  Future<void> fetchCategories() async {
    try {
      //loader
      isLoading.value = true;

      allPromoBanners(await _bannerRepository.getAllPromoBanners());
      // Filter featured ones

      isLoading.value = false;
    } catch (e) {
      CLoaders.errorSnackBar(title: "Oh Snaps", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
