import 'package:flutter/material.dart';

import '../../../../../../common/widgets/cards/branded_card.dart' ;
import '../../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';

class BrandShowCase extends StatelessWidget {
  const BrandShowCase({super.key, required this.dark, required this.images});

  final bool dark;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return CRoundedContainer(
      showBorder: true,
      backgroundColor:dark ?  CColors.black : CColors.white ,
      borderColor: CColors.darkerGrey,
      // height: CSizes.md,
      padding: const EdgeInsets.all(CSizes.spaceBtwItems/2),
      child: Column(
        spacing: CSizes.spaceBtwItems,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CBrandedCard(showBorder: false),
          Row(
            mainAxisSize: MainAxisSize.min,
            spacing: CSizes.sm,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
        width: 100,
        backgroundColor: dark ? CColors.darkerGrey : CColors.light,

        // margin: const EdgeInsets.only(right: CSizes.sm),
        // padding: const EdgeInsets.all(CSizes.md),
        child: Image.asset(index, fit: BoxFit.contain),
      ),
    );
  }
}