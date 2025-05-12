import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class CCheckBoxTheme {
  CCheckBoxTheme._();

  static CheckboxThemeData lightCheckboxThemeData = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.resolveWith((states) {
      return states.contains(WidgetState.selected) ? CColors.white : CColors.black;
    }),
    fillColor: WidgetStateProperty.resolveWith((states) {
      return states.contains(WidgetState.selected) ? Colors.red : CColors.transparent;
    }),
  );

  static CheckboxThemeData darkCheckboxThemeData = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.resolveWith((states) {
      return states.contains(WidgetState.selected) ? CColors.black : CColors.white;
    }),
    fillColor: WidgetStateProperty.resolveWith((states) {
      return states.contains(WidgetState.selected) ? CColors.primaryColor : CColors.transparent;
    }),
  );
}
