import 'package:ecommerceapp/app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerceapp/app/common/widgets/images/circular_images.dart';
import 'package:ecommerceapp/app/common/widgets/texts/product_price_text.dart';
import 'package:ecommerceapp/app/common/widgets/texts/product_title_text.dart';
import 'package:ecommerceapp/app/common/widgets/texts/rounded_title_with_text_verified_logo.dart';
import 'package:ecommerceapp/app/utils/constants/colors.dart';
import 'package:ecommerceapp/app/utils/constants/enums.dart';
import 'package:ecommerceapp/app/utils/constants/images_string.dart';
import 'package:ecommerceapp/app/utils/constants/sizes.dart';
import 'package:ecommerceapp/app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = CHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: CSizes.spaceBtwItems / 1.5,
      children: [
        Row(
          spacing: CSizes.spaceBtwItems,
          children: [
            CRoundedContainer(
              radius: CSizes.sm,
              backgroundColor: CColors.secondaryColor.withValues(alpha: 0.8),
              padding: const EdgeInsets.symmetric(horizontal: CSizes.sm, vertical: CSizes.xs),
              child: Text(
                '25%',
                style: Theme.of(context).textTheme.labelLarge!.apply(color: CColors.black),
              ),
            ),
            Text(
              '\$250',
              style: Theme.of(
                context,
              ).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),
            ),
            const CProductPriceText(price: '170', isLarge: true),
          ],
        ),
        const CProductTitleText(title: "Green Nike Sports Shirt"),
     Row(
       spacing: CSizes.spaceBtwItems,
       children: [const CProductTitleText(title: "Status"),Text("In Stock",style: Theme.of(context).textTheme.titleMedium,)],
     )
        ,
        Row(
          children: [
            CCircularImage(imgPath: CImages.shoeIcon,height: 32,width: 32,overlayColor: dark ? CColors.white:CColors.black ,),
            const CRoundedTitleWithTextVerifiedLogo(title: "Nike",brandTextSize: TextSizes.medium,),
          ],
        ),
      ],
    );
  }
}
