import 'package:ecommerceapp/app/utils/theme/custom_themes/appbar_theme.dart';
import 'package:ecommerceapp/app/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:ecommerceapp/app/utils/theme/custom_themes/check_box_theme.dart';
import 'package:ecommerceapp/app/utils/theme/custom_themes/chip_theme.dart';
import 'package:ecommerceapp/app/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:ecommerceapp/app/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';
import 'custom_themes/outlined_button_theme.dart';
import 'custom_themes/text_form_field_theme.dart';

class CThemeApp {
  CThemeApp._();
  static ThemeData lightThemeData = ThemeData(
    useMaterial3: true,
    fontFamily: GoogleFonts.poppinsTextTheme().labelSmall!.fontFamily,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: CTextTheme.lightTextTheme,
    scaffoldBackgroundColor: CColors.white,
    appBarTheme: CAppBarTheme.lightAppBarTheme,
    checkboxTheme: CCheckBoxTheme.lightCheckboxThemeData,
    outlinedButtonTheme: COutlinedButtonThemeData.lightOutlinedButtonTheme,
    elevatedButtonTheme: CElevatedButtonTheme.lightElevatedButtonTheme,
    bottomSheetTheme: CBottomSheet.lightBottomSheetTheme,
    chipTheme: CChipTheme.lightChipTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkThemeData = ThemeData(
    useMaterial3: true,
    fontFamily: GoogleFonts.poppinsTextTheme().labelSmall!.fontFamily,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: CColors.black,
    elevatedButtonTheme: CElevatedButtonTheme.darkElevatedButtonTheme,
    textTheme: CTextTheme.darkTextTheme,
    primaryColor: Colors.blue,
    appBarTheme: CAppBarTheme.darkAppBarTheme,
    outlinedButtonTheme: COutlinedButtonThemeData.darkOutlinedButtonTheme,
    bottomSheetTheme: CBottomSheet.darkBottomSheetTheme,
    checkboxTheme: CCheckBoxTheme.darkCheckboxThemeData,
    chipTheme: CChipTheme.darkChipTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}
