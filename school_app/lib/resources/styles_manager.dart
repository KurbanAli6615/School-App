import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:school_app/resources/color_manager.dart';
import 'package:school_app/resources/values_manager.dart';

import 'font_manager.dart';

InputDecoration getTextFieldDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(AppRadius.r15),
  ),
  hintStyle: getRegularStyle(
    color: ColorManager.grey,
    fontSize: FontSize.s12,
  ),
  contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
);

ShapeBorder getRoundedButtonShape = const RoundedRectangleBorder(
  borderRadius: BorderRadius.all(Radius.circular(50)),
);

ShapeBorder getBackButtonShape = const RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(30),
  ),
);

Widget getBuzyPage({Color? color = ColorManager.white}) {
  return Align(
    alignment: Alignment.center,
    child: SpinKitThreeBounce(
      color: color ?? ColorManager.white,
      size: 20.0,
    ),
  );
}

TextStyle _getTextStyle(
    double fontSize, String fontFamily, FontWeight fontWeight, Color? color) {
  return TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

// regular text style
TextStyle getRegularStyle({
  double? fontSize,
  required Color color,
}) {
  return _getTextStyle(
    fontSize ?? FontSize.s12,
    FontConstants.fontFamily,
    FontWeightManager.regular,
    color,
  );
}

// light text style
TextStyle getLightStyle({
  double? fontSize,
  required Color color,
}) {
  return _getTextStyle(
    fontSize ?? FontSize.s12,
    FontConstants.fontFamily,
    FontWeightManager.light,
    color,
  );
}

// bold text style
TextStyle getBoldStyle({
  double? fontSize,
  required Color color,
}) {
  return _getTextStyle(
    fontSize ?? FontSize.s12,
    FontConstants.fontFamily,
    FontWeightManager.bold,
    color,
  );
}

// semibold text style
TextStyle getSemiBoldStyle({
  double? fontSize,
  Color? color,
}) {
  return _getTextStyle(
    fontSize ?? FontSize.s12,
    FontConstants.fontFamily,
    FontWeightManager.semibold,
    color,
  );
}

// medium text style
TextStyle getMediumStyle({
  double? fontSize,
  required Color color,
}) {
  return _getTextStyle(
    fontSize ?? FontSize.s12,
    FontConstants.fontFamily,
    FontWeightManager.medium,
    color,
  );
}
