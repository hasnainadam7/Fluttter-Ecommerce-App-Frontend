
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import 'brand_card.dart';

class CBrandShowcase extends StatelessWidget {
  const CBrandShowcase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return CRoundedContainer(
      showBorder: true,
      borderColor: CColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(CSizes.md),
      margin: const EdgeInsets.only(bottom: CSizes.spaceBtwItems),
      child: Column(
        children: [
          /// Brand with Products Count
          const CBrandCard(showBorder: false),
          const SizedBox(height: CSizes.spaceBtwItems),

          /// Brand Top 3 Product Images
          Row(
            children: images
                .map((image) => brandTopProductImageWidget(image, context))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
      child: CRoundedContainer(
        height: 100,
        backgroundColor: CHelperFunctions.isDarkMode(context)
            ? CColors.darkerGrey
            : CColors.light,
        margin: const EdgeInsets.only(right: CSizes.sm),
        padding: const EdgeInsets.all(CSizes.md),
        child: Image(
          fit: BoxFit.contain,
          image: AssetImage(image),
        ),
      ),
    );
  }
}


