import 'package:ecommerceapp/app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class CounterIcon extends StatelessWidget {
  const CounterIcon({super.key, required this.dark});
  final bool dark;
  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        IconButton(onPressed: () {}, icon:  Icon(Iconsax.shopping_bag, color:dark ?  CColors.white : CColors.black)),
        Positioned(
          right: 0,
          child: Container(
            height: 18,
            width: CSizes.buttonHeight,
            decoration: BoxDecoration(
              color: dark ?  CColors.white : CColors.black,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                "2",
                style: Theme.of(
                  context,
                ).textTheme.labelLarge!.apply(color: !dark ?  CColors.white : CColors.black, fontSizeFactor: 0.8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
