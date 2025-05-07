import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../custom_shapes/containers/rounded_container.dart';

class CCouponCode extends StatelessWidget {
  const CCouponCode({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);

    return CRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? CColors.dark : CColors.white,
      padding: const EdgeInsets.all(
        CSizes.sm,
      ),
      child: Row(
        spacing: CSizes.sm,
        children: [
          /// TextField
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Have a promo code? Enter here',
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          // SizedBox(width:  ),
          /// Button
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: dark
                    ? CColors.white.withValues(alpha: 0.5)
                    : CColors.dark.withValues(alpha: 0.5),
                backgroundColor: CColors.grey.withValues(alpha: 0.2),
                side: BorderSide(color: Colors.grey.withValues(alpha: 0.1)),
              ),
              child: const Text('Apply'),
            ),
          ),
        ],
      ),
    );
  }
}
