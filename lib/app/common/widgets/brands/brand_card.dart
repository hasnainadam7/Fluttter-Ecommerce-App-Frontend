import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import '../images/circular_images.dart';
import '../texts/brand_title_text_with_verified_icon.dart';

class CBrandCard extends StatelessWidget {
  const CBrandCard({
    super.key, required this.showBorder, this.onTap, required this.imgPath, required this.title,
  });
  final String imgPath,title;
  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = CHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      /// Container Design
      child: CRoundedContainer(
        padding: const EdgeInsets.all(CSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// --- Icon
            Flexible(
              child: CCircularImage(
                imgPath: imgPath,
                isNetworkImage: true,
                backgroundColor: Colors.transparent,
                overlayColor:
                isDark
                    ? CColors.white
                    : CColors.black,
              ),
            ),
            const SizedBox(
                width: CSizes.spaceBtwItems / 2),

            /// --- Text
            // [Expanded] & Column [MainAxisSize.min] is important to keep the elements in the vertical center & also
            // to keep text inside the boundaries
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                   CBrandTitleWithVerifiedIcon(
                    title: title,
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    '256 Products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}