import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class COrderListItems extends StatelessWidget {
  const COrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);

    return ListView.separated(
      shrinkWrap: true,
      itemCount: 10,
      separatorBuilder: (_, __) => const SizedBox(height: CSizes.spaceBtwItems),
      itemBuilder:
          (_, index) => CRoundedContainer(
            showBorder: true,
            padding: const EdgeInsets.all(CSizes.md),
            backgroundColor: dark ? CColors.dark : CColors.light,
            child: Column(
              spacing: CSizes.spaceBtwItems,
              mainAxisSize: MainAxisSize.min,
              children: [
                /// -- Row 1
                Row(
                  spacing: CSizes.spaceBtwItems / 2,
                  children: [
                    /// 1 - Icon
                    const Icon(Iconsax.ship),

                    /// 2 - Status & Date
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Processing',
                            style: Theme.of(context).textTheme.bodyLarge!.apply(
                              color: CColors.primaryColor,
                              fontWeightDelta: 1,
                            ),
                          ),
                          Text('07 Nov 2024', style: Theme.of(context).textTheme.headlineSmall),
                        ],
                      ),
                    ),

                    /// 3 - Icon
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Iconsax.arrow_right_34, size: CSizes.iconSm),
                    ),
                  ],
                ),

                /// -- Row 2
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        spacing: CSizes.spaceBtwItems / 2,
                        children: [
                          /// 1 - Icon
                          const Icon(Iconsax.tag),

                          /// 2 - Status & Date
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Order', style: Theme.of(context).textTheme.labelMedium),
                                Text('[#2566f2]', style: Theme.of(context).textTheme.titleMedium),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        spacing: CSizes.spaceBtwItems / 2,
                        children: [
                          /// 1 - Icon
                          const Icon(Iconsax.calendar),

                          /// 2 - Status & Date
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Shipping Date',
                                  style: Theme.of(context).textTheme.labelMedium,
                                ),
                                Text('03 Feb 2024', style: Theme.of(context).textTheme.titleMedium),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
    );
  }
}
