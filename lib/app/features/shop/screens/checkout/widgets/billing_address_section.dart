import 'package:ecommerceapp/app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/sizes.dart';

class CBillingAddressSection extends StatelessWidget {
  const CBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = CHelperFunctions.isDarkMode(context);
    return Column(
      spacing: CSizes.spaceBtwItems / 2,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CSectionHeading(
          title: 'Shipping Address',
          buttonTitle: 'Change',
          onPressed: () {},
          dark: dark,
        ),
        Text('Johnny Smith', style: Theme.of(context).textTheme.bodyLarge),

        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(width: CSizes.spaceBtwItems),
            Text('+92-137-8058254', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),

        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 16),
            const SizedBox(width: CSizes.spaceBtwItems),
            Expanded(
              child: Text(
                'South Liana, Maine 87694, USA',
                style: Theme.of(context).textTheme.bodyMedium,
                softWrap: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
