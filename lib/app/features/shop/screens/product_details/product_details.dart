
import 'package:flutter/material.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import 'widgets/product_attriubute.dart';
import 'widgets/product_image_slider.dart';
import 'widgets/product_meta_data.dart';
import 'widgets/rating_share.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = CHelperFunctions.isDarkMode(context);

    return Scaffold(
      // appBar:
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            ProductImageSlider(dark: dark),
            const Padding(
              padding: EdgeInsets.only(
                right: CSizes.defaultSpace,
                left: CSizes.defaultSpace,
                bottom: CSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  CRatingAndShare(),
                  ProductMetaData(),
                  ProductAttributes()
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}






