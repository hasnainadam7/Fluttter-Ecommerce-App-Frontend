import 'package:ecommerceapp/app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/sizes.dart';

import '../custom_shapes/containers/rounded_container.dart';
import '../images/circular_images.dart';
import '../texts/brand_title_text_with_verified_icon.dart';

class CBrandedCard extends StatelessWidget {
  const CBrandedCard({
    super.key,
    this.showBorder = true,
    this.onTap,
    required this.title,
    required  this.imgPath,
  });
  final bool showBorder;
  final VoidCallback? onTap;
  final String title;
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    bool dark = CHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: CRoundedContainer(
        padding: const EdgeInsets.all(CSizes.sm),
        showBorder: showBorder,
        backgroundColor: CColors.transparent,
        child: Row(
          spacing: CSizes.sm,
          children: [
            Flexible(
              child: CCircularImage(
                isNetworkImage: true,
                imgPath: imgPath,
                overlayColor: !dark ? CColors.white : CColors.black,
                backgroundColor: dark ? CColors.white : CColors.black,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                // spacing: CSizes.sm ,
                children: [
                  CBrandTitleWithVerifiedIcon(
                    title: title,
                    brandTextSize: TextSizes.large,
                    textColor: dark ? CColors.white : CColors.black,
                  ),
                  Text(
                    "256 Products",

                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(
                      context,
                    ).textTheme.labelMedium!.apply(color: dark ? CColors.white : CColors.black),
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
