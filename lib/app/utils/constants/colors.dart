import 'package:flutter/cupertino.dart';

class CColors {
  CColors._();

  // App theme colors
  static const Color primaryColor = Color(0xFF4b68ff);
  static const Color secondaryColor = Color(0xFFffe24b);
  static const Color accentColor = Color(0xFFb0c7ff);

  // Text colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6c757d);
  static const Color textWhite = Color(0xffffffff);

  // Background colors
  static const Color light = Color(0xFFf6f6f6);
  static const Color dark = Color(0xFF272727);
  static const Color transparent = Color(0x00ffffff);
  static const Color primaryBackground = Color(0xfff3f5ff);

  // Background Container colors
  static const Color lightContainer = Color(0xFFf6f6f6);
  static const Color darkContainer = Color(0xffffffff);

  // Button colors
  static const Color buttonPrimary = Color(0xFF4b68ff);
  static const Color buttonSecondary = Color(0xFFf6757d);
  static const Color buttonDisabled = Color(0xffc4c4c4);

  // Border colors
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);

  // Error and validation colors
  static const Color error = Color(0xFFd32f2f);
  static const Color succuess = Color(0xFF388e3c);
  static const Color warning = Color(0xfff57c00);
  static const Color info = Color(0xFF1976d2);

  // Neutral Shades
  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFF4f4f4f);
  static const Color darkGrey = Color(0xff939393);
  static const Color grey = Color(0xFFe0e0e0);
  static const Color softGrey = Color(0xfff4f4f4);
  static const Color lightgrey = Color(0xFFf9f9f9);
  static const Color white = Color(0xFFffffff);

  // Gradient Colors
  static const Gradient linearGradient = LinearGradient(
    colors: [Color(0xffff9a9e), Color(0xfffad0c4), Color(0xfffad0c4)],
    begin: Alignment(0, 0),
    end: Alignment(0.707, -0.707),
  );
}
