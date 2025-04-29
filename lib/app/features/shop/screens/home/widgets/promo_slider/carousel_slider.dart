import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerceapp/app/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../../common/widgets/images/rounded_images.dart';
import '../../../../../../utils/constants/images_string.dart';
import '../../../../controllers/home_controller.dart';

class CCarouselSlider extends StatelessWidget {
  const CCarouselSlider({super.key, required this.controller, required this.dark});
  final bool dark;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: dark ? CColors.black :,
      child: CarouselSlider(
        items: List.generate(3, (index) {
          return CRoundedImages(
backgroundColor: CColors.transparent ,
            imgUrl: [CImages.promoBanner1, CImages.promoBanner2, CImages.promoBanner3][index],
          );
        }),

        options: CarouselOptions(

          // height: 200,
          autoPlay: true,
          onPageChanged: (index, _) {
            controller.updateCarouselIndex(index);
          },
          viewportFraction: 1,
        ),
      ),
    );
  }
}
