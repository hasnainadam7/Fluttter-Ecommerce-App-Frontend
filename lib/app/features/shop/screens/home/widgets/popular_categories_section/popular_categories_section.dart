import 'package:ecommerceapp/app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/texts.dart';

import 'vertical_images_and_texts.dart';

class PopularCategoriesSection extends StatelessWidget {
  const PopularCategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = CHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: CSizes.spaceBtwItems,
      children: [
        CSectionHeading(title: CTexts.popularCategories, showActionButton: false, dark: dark),
      const  VerticalImagesAndText(),
      ],
    );
  }
}
