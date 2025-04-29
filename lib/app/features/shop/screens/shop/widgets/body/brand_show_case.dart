import 'package:flutter/material.dart';

import '../../../../../../common/widgets/cards/branded_card.dart' ;
import '../../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';

class BrandShowCase extends StatelessWidget {
  const BrandShowCase({super.key, required this.isDark, required this.images});

  final bool isDark;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return CRoundedContainer(
      showBorder: true,
      backgroundColor:isDark ?  CColors.black : CColors.white ,
      borderColor: CColors.darkerGrey,
      // height: CSizes.md,
      padding: const EdgeInsets.all(CSizes.sm),
      child: Column(
        spacing: CSizes.spaceBtwItems,
        children: [
          const CBrandedCard(showBorder: false),
          Row(
            mainAxisSize: MainAxisSize.min,
            // children: List.generate(3,
            children:
            images.map((index) {
              return imagesForShowCase(index);
            }).toList(),
            // [

            // )],
          ),
        ],
      ),
    );
  }

  Expanded imagesForShowCase(String index) {
    return Expanded(
      child: CRoundedContainer(
        height: 100,
        backgroundColor: isDark ? CColors.darkerGrey : CColors.light,
        margin: const EdgeInsets.only(right: CSizes.sm),
        padding: const EdgeInsets.all(CSizes.md),
        child: Image.asset(index, fit: BoxFit.contain),
      ),
    );
  }
}