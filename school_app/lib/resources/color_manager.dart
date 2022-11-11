import 'package:flutter/material.dart';

class ColorManager {
  static const Color scaffoldBg = Color(0xff0D243C);
  static const Color primaryK = Color(0xff0087FF);
  static const Color borderGrey = Color(0xffD1D5DB);
  static const Color bottomNav = Color(0xFF07192C);
  static const Color yourCredentialCardColor = Color(0xFFFBBB3F);
  static const Color green = Colors.green;
  static const Color red = Colors.red;
  static const Color greyColor = Color(0xFFD9D9D9);
  static const Color primary = Color(0xFF3699ff);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);

  static Color primaryOpacity70 = ColorManager.primary.withOpacity(0.7);
  static const Color accent = Color(0xFF3699ff);
  static Color accentOpacity70 = ColorManager.accent.withOpacity(0.7);

  static const Color darkGrey = Color(0xFF6B7280);
  static const Color grey = Color(0xFF737477);
  static const Color lightGrey = Color(0xFF9E9E9E);

  static const Color grey1 = Color(0xFF707070);

  static const Color error = Color(0xFFE61F34);
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = 'FF$hexColorString'; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
