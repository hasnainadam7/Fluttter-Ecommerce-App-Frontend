import 'package:ecommerceapp/app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ecommerceapp/app/common/widgets/texts/product_price_text.dart';
import 'package:ecommerceapp/app/common/widgets/texts/product_title_text.dart';
import 'package:ecommerceapp/app/common/widgets/texts/section_heading.dart';
import 'package:ecommerceapp/app/features/shop/screens/home/widgets/product_card_vertical/product_title.dart';
import 'package:ecommerceapp/app/utils/constants/colors.dart';
import 'package:ecommerceapp/app/utils/constants/sizes.dart';
import 'package:ecommerceapp/app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = CHelperFunctions.isDarkMode(context);

    return CRoundedContainer(
      padding: EdgeInsets.all(CSizes.md),
      backgroundColor: dark ? CColors.darkerGrey : CColors.grey,
      child: Column(
        children: [
          Row(
            spacing: CSizes.spaceBtwItems,
            children: [
              CSectionHeading(
                padding: EdgeInsets.zero,
                title: "Validation",
                dark: dark,
                showActionButton: false,
              ),
              CProductTitleText(title: "Price",smallSize: true,),
              Row(
                spacing: CSizes.spaceBtwItems,
                children: [
                  Text("\$25",style: Theme.of(context).textTheme.titleSmall!.apply(
                    decoration: TextDecoration.lineThrough
                  ),),
                  CProductPriceText(price: "20",
                  )
                ],
              )
            ],
          ),
          Row()
        ],
      ),
    );
  }
}
