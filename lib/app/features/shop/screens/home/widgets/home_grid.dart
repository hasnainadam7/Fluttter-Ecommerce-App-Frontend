import 'package:flutter/material.dart';

import '../../../../../common/widgets/layout/grid_layout.dart';
import 'product_card_vertical/product_card_vertical.dart';

class HomeGrid extends StatelessWidget {
  const HomeGrid({super.key, required this.dark});

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return CGridLayout(
      dark: dark,
      itemCount: 4,
      itemBuilder: (_, index) {
        return ProductCardVertical(isDark: dark);
      },
    );
  }
}
