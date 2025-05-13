import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/app/common/widgets/shimmer_effect/shimmer_effect.dart';
import 'package:flutter/material.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/images_string.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/texts.dart';

class VerticalImagesAndText extends StatelessWidget {
  const VerticalImagesAndText({
    super.key,
    this.images = CImages.shoeIcon,
    this.title = CTexts.shoesLabels,
    this.textColor = CColors.dark,
    this.backgroundColor = CColors.light,
    this.onTap,
  });

  final String images, title;
  final Color textColor, backgroundColor;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: CSizes.spaceBtwItems),
        child: Column(
          spacing: CSizes.spaceBtwItems / 2,
          children: [
            // SizedBox(height: 0,),
            Container(
              height: 56,
              width: 56,
              padding: const EdgeInsets.all(CSizes.sm),
              decoration: BoxDecoration(color: textColor, borderRadius: BorderRadius.circular(100)),
              child: Center(
                child: CachedNetworkImage(
                  progressIndicatorBuilder:
                      (context, url, downloadProgress) => CShimmerEffect(width: 56, height: 56),
                  imageUrl: images,
                  fit: BoxFit.cover,
                  color: backgroundColor,
                ),
                // child: Image.asset(images, fit: BoxFit.cover, color: backgroundColor),
              ),
            ),
            SizedBox(
              width: 55,
              child: Text(
                title,

                style: Theme.of(context).textTheme.labelMedium!.apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
