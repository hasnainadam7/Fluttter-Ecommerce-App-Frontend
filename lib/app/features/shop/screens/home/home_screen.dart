import 'package:flutter/material.dart';

import '../../../../common/widgets/search_bar/search_bar.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/texts.dart';
import '../../../../utils/helpers/helper_functions.dart';
import 'widgets/home_app_bar/home_app_bar.dart';
import 'widgets/home_grid.dart';
import 'widgets/popular_categories_section/popular_categories_section.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';

import 'widgets/promo_slider/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = CHelperFunctions.isDarkMode(context);


    return Scaffold(
      body: Column(
        children: [
          CPrimaryHeaderContainer(
            child: Column(
              spacing: CSizes.spaceBtwSections,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeAppBar(dark: dark),
                CSearchBar(text: CTexts.searchBarTitleHome, dark: dark),

                const PopularCategoriesSection(),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: [PromoSlider(dark: dark), HomeGrid(dark: dark)]),
            ),
          ),
        ],
      ),
    );
  }
}
