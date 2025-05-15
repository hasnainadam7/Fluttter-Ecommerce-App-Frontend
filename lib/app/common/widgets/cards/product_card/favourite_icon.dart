import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'circular_icon.dart';

class CFavouriteIcon extends StatelessWidget {
  const CFavouriteIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const CCircularIcon(color: Colors.red, icon: Iconsax.heart5);
  }
}
