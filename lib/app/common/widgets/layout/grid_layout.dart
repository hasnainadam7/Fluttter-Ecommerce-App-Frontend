import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class CGridLayout extends StatelessWidget {
  const CGridLayout({
    super.key,
    required this.dark,
    required this.itemCount,
    required this.itemBuilder,
    this.mainAxisExtent = (258),
    this.padding = const EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
  });
  final double mainAxisExtent;
  final bool dark;
  final int itemCount;
  final EdgeInsetsGeometry padding;
  final Widget? Function(BuildContext, int) itemBuilder;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: GridView.builder(
        itemCount: itemCount,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: CSizes.gridViewSpacing,
          crossAxisSpacing: CSizes.gridViewSpacing,
          mainAxisExtent: mainAxisExtent,
        ),
        shrinkWrap: true,
        itemBuilder: itemBuilder,
      ),
    );
  }
}
