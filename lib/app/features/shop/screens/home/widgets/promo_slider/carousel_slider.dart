import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerceapp/app/common/widgets/shimmer_effect/shimmer_effect.dart';
import 'package:ecommerceapp/app/features/shop/controllers/banner_controller.dart';
import 'package:ecommerceapp/app/utils/constants/colors.dart';
import 'package:ecommerceapp/app/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../../common/widgets/images/rounded_images.dart';

class CCarouselSlider extends StatelessWidget {
  const CCarouselSlider({super.key, required this.dark});
  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (BannerController.instance.isLoading.value) {
        return const CShimmerEffect(width: double.infinity,radius: 0,);
      }

      return CarouselSlider(
        items: List.generate(BannerController.instance.allPromoBanners.length, (index) {
          final bannerItem = BannerController.instance.allPromoBanners[index].banner;

          return CRoundedImages(
            padding: const EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
            isNetworkImage: true,
            backgroundColor: CColors.transparent,
            imgUrl: bannerItem,
          );
        }),
        options: CarouselOptions(
          autoPlay: false,

          onPageChanged: (index, _) {
            BannerController.instance.updateCarouselIndex(index);
          },
          viewportFraction: 1,
        ),
      );
    });
  }
}
