import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class CElevatedButtonTheme {
  CElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: CColors.light,
      backgroundColor: CColors.primaryColor,
      disabledForegroundColor: CColors.darkGrey,
      disabledBackgroundColor: CColors.buttonDisabled,
      // side: const BorderSide(color: CColors.primaryColor),
      padding: const EdgeInsets.symmetric(vertical: CSizes.buttonHeight),
      textStyle: const TextStyle(fontSize: 16, color: CColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(CSizes.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: CColors.light,
      backgroundColor: CColors.primaryColor,
      disabledForegroundColor: CColors.darkGrey,
      disabledBackgroundColor: CColors.darkerGrey,
      // side: BorderSide(color: CColors.primaryColor),
      padding: const EdgeInsets.symmetric(vertical: CSizes.buttonHeight),
      textStyle: const TextStyle(fontSize: 16, color: CColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(CSizes.buttonRadius)),
    ),
  );
}
