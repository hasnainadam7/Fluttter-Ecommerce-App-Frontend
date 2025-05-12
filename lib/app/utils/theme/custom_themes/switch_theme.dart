import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class CSwitchTheme {
  CSwitchTheme._();

  static final SwitchThemeData lightSwitchTheme = SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith((states) {
      return states.contains(WidgetState.selected) ? CColors.primaryColor : CColors.grey;
    }),
    trackColor: WidgetStateProperty.resolveWith((states) {
      return states.contains(WidgetState.selected) ? CColors.primaryColor.withValues(alpha:0.5) : CColors.grey.withValues(alpha:0.3);
    }),
  );

  static final SwitchThemeData darkSwitchTheme = SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith((states) {
      return states.contains(WidgetState.selected) ? CColors.primaryColor : CColors.white;
    }),
    trackColor: WidgetStateProperty.resolveWith((states) {
      return states.contains(WidgetState.selected)
          ? CColors.primaryColor.withValues(alpha: 0.5)
          : CColors.white.withValues(alpha:0.3);
    }),
  );
}
