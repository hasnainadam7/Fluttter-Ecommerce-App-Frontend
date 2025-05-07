import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../common/widgets/cards/branded_card.dart';
import '../../../../../../common/widgets/layout/grid_layout.dart';
import '../../../../../../common/widgets/search_bar/search_bar.dart';
import '../../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/texts.dart';
import '../../../brands/all_brands.dart';

class ShopFlexibleSpaceWidget extends StatelessWidget {
  const ShopFlexibleSpaceWidget({super.key, required this.dark});

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.all(CSizes.defaultSpace ),
      // child: Container()
child:
      ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          CSearchBar(
            // padding: EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
            padding: EdgeInsets.zero,
            showBorder: true,
            showBackground: false,

            text: CTexts.searchBarTitleHome,
            dark: dark,
          ),

          CSectionHeading(
            textColor: CColors.dark,
            padding: EdgeInsets.zero,
            title: CTexts.featureBrands,
            showActionButton: true,
            onPressed: () {Get.to(()=>const AllBrandsScreen());},
            dark: dark,
          ),

          CGridLayout(
            dark: dark,
            itemCount: 4,
            padding: EdgeInsets.zero,
            mainAxisExtent: 80,
            itemBuilder: (_, index) {
              return const CBrandedCard(showBorder: true);
            },
          ),
        ],
      ),
    );
  }
}
