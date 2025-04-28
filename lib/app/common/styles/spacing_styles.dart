import 'package:flutter/cupertino.dart';

import '../../utils/constants/sizes.dart';

class CSpacingStyle {
  CSpacingStyle._();
  static EdgeInsetsGeometry paddingWithAppBarHeight = const EdgeInsets.only(
    top: CSizes.appHeight,
    left: CSizes.defaultSpace,
    bottom: CSizes.defaultSpace,
    right: CSizes.defaultSpace,
  );
}
