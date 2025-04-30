import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  final RxInt carouselCurrentIndex = 0.obs;

  void updateCarouselIndex(index) {
    carouselCurrentIndex.value = index;
    update();
  }

}
