import 'package:flutter/material.dart';

import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/texts.dart';
import '../section_heading.dart';
import 'vertical_images_and_texts.dart';

class PopularCategoriesSection extends StatelessWidget {
  const PopularCategoriesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: CSizes.spaceBtwItems,
      children: [
        SectionHeading(title: CTexts.popularCategories, showActionButton: false),
        VerticalImagesAndText(),
      ],
    );
  }
}