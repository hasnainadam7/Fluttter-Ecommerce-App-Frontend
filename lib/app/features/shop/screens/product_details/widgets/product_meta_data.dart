import 'package:ecommerceapp/app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerceapp/app/common/widgets/images/circular_images.dart';
import 'package:ecommerceapp/app/common/widgets/texts/product_price_text.dart';
import 'package:ecommerceapp/app/common/widgets/texts/product_title_text.dart';
import 'package:ecommerceapp/app/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:ecommerceapp/app/features/shop/models/product_model.dart';
import 'package:ecommerceapp/app/utils/constants/colors.dart';
import 'package:ecommerceapp/app/utils/constants/enums.dart';
import 'package:ecommerceapp/app/utils/constants/sizes.dart';
import 'package:ecommerceapp/app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final String discountedPercentage =
        "${100 - ((product.salePrice / product.price) * 100).toInt()}%";

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
                discountedPercentage,
                style: Theme.of(context).textTheme.labelLarge!.apply(color: CColors.black),
              ),
            ),
            if (product.productType == ProductType.single && product.salePrice > 0)
              Text(
                '\$${product.price}',
                style: Theme.of(
                  context,
                ).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),
              ),
            CProductPriceText(price: '\$${product.salePrice}', isLarge: true),
          ],
        ),
        CProductTitleText(title: product.title),
        Row(
          spacing: CSizes.spaceBtwItems,
          children: [
            const CProductTitleText(title: "Status"),
            Text(
              product.stock > 0 ? "In Stock" : "Out Stock",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        Row(
          children: [
            CCircularImage(
              isNetworkImage: true,
              imgPath:product.brand!.image,
              height: 32,
              width: 32,
              overlayColor: dark ? CColors.white : CColors.black,
            ),
             CBrandTitleWithVerifiedIcon(title:product.brand!.name, brandTextSize: TextSizes.medium),
          ],
        ),
      ],
    );
  }
}
