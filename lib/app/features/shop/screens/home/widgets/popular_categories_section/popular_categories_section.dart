import 'package:flutter/material.dart';

import '../../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/texts.dart';

import 'vertical_images_and_texts.dart';

class PopularCategoriesSection extends StatelessWidget {
  const PopularCategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {

    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: CSizes.spaceBtwItems,
      children: [
        CSectionHeading(
          padding: EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
          title: CTexts.popularCategories,
          showActionButton: false,
          dark: true,
        ),
        VerticalImagesAndText(),
      ],
    );
  }
}
