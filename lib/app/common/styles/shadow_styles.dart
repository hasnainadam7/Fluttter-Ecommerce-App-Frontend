import 'package:ecommerceapp/app/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';

class CShadowStyles {
  CShadowStyles._();
  static List<BoxShadow> verticalProductShadow = [
    BoxShadow(
      color: CColors.darkGrey.withValues(alpha: 0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: Offset(0, 2),
    ),
  ];

  static List<BoxShadow> horizontalProductShadow = [
    BoxShadow(
      color: CColors.darkGrey.withValues(alpha: 0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: Offset(0, 2),
    ),
  ];
}
