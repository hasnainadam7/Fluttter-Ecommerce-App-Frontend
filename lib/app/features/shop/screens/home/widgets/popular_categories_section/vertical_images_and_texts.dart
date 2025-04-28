import 'package:flutter/material.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/images_string.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/texts.dart';

class VerticalImagesAndText extends StatelessWidget {
  const VerticalImagesAndText({
    super.key,
     this.images = CImages.shoeIcon,
     this.title = CTexts.popularCategories,
     this.textColor = CColors.white,
     this.backgroundColor = CColors.dark,
     this.onTap ,
  });

  final String images, title;
  final Color textColor, backgroundColor;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
        child: SizedBox(
          height: 120,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 6,
            scrollDirection: Axis.horizontal,

            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.only(right: CSizes.spaceBtwItems),
                child: Column(
                  spacing: CSizes.spaceBtwItems / 2,
                  children: [
                    Container(
                      height: 56,
                      width: 56,
                      padding: const EdgeInsets.all(CSizes.sm),
                      decoration: BoxDecoration(
                        color: CColors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Image.asset(images, fit: BoxFit.cover, color: backgroundColor),
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
              );
            },
          ),
        ),
      ),
    );
  }
}
