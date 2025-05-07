import 'package:ecommerceapp/app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/images_string.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class CBillingPaymentSection extends StatelessWidget {
  const CBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);

    return Column(
      spacing: CSizes.spaceBtwItems / 2,
      children: [
        CSectionHeading(
          title: 'Payment Method',
          buttonTitle: 'Change',
          onPressed: () {}, dark: dark,
        ),

        Row(
          children: [
           CRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ?CColors.light : CColors.white,
              padding: const EdgeInsets.all(CSizes.sm),
              child: const Image(
                image: AssetImage(CImages.paypal),
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width:CSizes.spaceBtwItems / 2),
            Text('Paypal', style: Theme.of(context).textTheme.bodyLarge),
          ],
        )
      ],
    );
  }
}
