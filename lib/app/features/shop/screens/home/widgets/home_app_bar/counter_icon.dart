import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';

class CounterIcon extends StatelessWidget {
  const CounterIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(onPressed: () {}, icon: const Icon(Iconsax.shopping_bag, color: CColors.white)),
        Positioned(
          right: 0,
          child: Container(
            height: 18,
            width: CSizes.buttonHeight,
            decoration: BoxDecoration(
              color: CColors.black,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                "2",
                style: Theme.of(
                  context,
                ).textTheme.labelLarge!.apply(color: CColors.white, fontSizeFactor: 0.8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
