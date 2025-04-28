

import 'package:flutter/material.dart';

import '../../../../common/widgets/search_bar/search_bar.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/texts.dart';
import '../../../../utils/helpers/helper_functions.dart';
import 'widgets/home_app_bar/home_app_bar.dart';
import 'widgets/home_grid.dart';
import 'widgets/popular_categories_section/popular_categories_section.dart';
import 'widgets/primary_header_container.dart';

import 'widgets/promo_slider/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: Column(
        children: [
          PrimaryHeaderContainer(
            child: Column(
              spacing: CSizes.spacesBtwSections,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeAppBar(),
                CSearchBar(text: CTexts.searchBarTitleHome, isDark: dark),

                const PopularCategoriesSection(),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  PromoSlider(dark: dark),
                  HomeGrid(dark: dark),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


