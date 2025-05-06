import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/images_string.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../images/rounded_images.dart';
import '../texts/brand_title_text_with_verified_icon.dart';
import '../texts/product_title_text.dart';

class CCartItem extends StatelessWidget {
  const CCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Image
        CRoundedImages(
      imgUrl: CImages.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(CSizes.sm),
          backgroundColor: CHelperFunctions.isDarkMode(context)
              ? CColors.darkerGrey
              : CColors.light,
        ),
        const SizedBox(width: CSizes.spaceBtwItems),

        /// Title, Price, & Size
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CBrandTitleWithVerifiedIcon(title: 'Nike'),
            const Flexible(
              child: CProductTitleText(
                title: 'Black Sports Shoes',
                maxLines: 1,
              ),
            ),

            /// Attributes
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: 'Color ',
                      style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(
                      text: 'Green ',
                      style: Theme.of(context).textTheme.bodyLarge),
                  TextSpan(
                      text: 'Size ',
                      style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(
                      text: 'UK 08 ',
                      style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}