import 'package:ecommerceapp/app/common/widgets/appBar/app_bar.dart';
import 'package:ecommerceapp/app/features/auth/screens/app_bar/counter_icon.dart';
import 'package:ecommerceapp/app/utils/constants/sizes.dart';
import 'package:ecommerceapp/app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/headings/section_heading.dart';
import '../../../../common/widgets/search_bar/search_bar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/texts.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = CHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: CAppBar(
        title: Text("Store", style: Theme.of(context).textTheme.headlineMedium),
        actions: [CounterIcon()],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (_, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              floating: false,
              // backgroundColor: isDark ? CColors.black : CColors.white,
              expandedHeight: Get.height * 0.4,
              flexibleSpace: Padding(
                padding: EdgeInsets.all(CSizes.defaultSpace),
                child: ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    SizedBox(height: CSizes.spaceBtwItems),
                    CSearchBar(
                      padding: EdgeInsets.zero,
                      text: CTexts.searchBarTitleHome,
                      isDark: isDark,
                    ),
                    SizedBox(height: CSizes.spacesBtwSections),
                    SectionHeading(
                      padding: EdgeInsets.zero,
                      title: CTexts.featureBrands,
                      showActionButton: false,
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: Container(),
      ),
    );
  }
}
