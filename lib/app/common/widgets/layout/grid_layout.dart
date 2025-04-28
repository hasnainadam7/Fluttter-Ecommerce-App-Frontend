import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/sizes.dart';

class CGridLayout extends StatelessWidget {
  const CGridLayout({
    super.key,
    required this.dark,
    required this.itemCount,
    required this.itemBuilder,
  });

  final bool dark;
  final int itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
      child: GridView.builder(
        itemCount: itemCount,
        padding: EdgeInsets.zero,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: CSizes.gridViewSpacing,
          crossAxisSpacing: CSizes.gridViewSpacing,
          mainAxisExtent: Get.height * 0.281,
        ),
        shrinkWrap: true,
        itemBuilder: itemBuilder,
      ),
    );
  }
}
