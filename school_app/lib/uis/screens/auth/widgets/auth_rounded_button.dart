import 'package:flutter/material.dart';
import 'package:school_app/resources/color_manager.dart';
import 'package:school_app/resources/font_manager.dart';
import 'package:school_app/resources/strings_manager.dart';
import 'package:school_app/resources/styles_manager.dart';
import 'package:school_app/resources/values_manager.dart';

import '../../../widgets/app_rounded_button.dart';

class LoginRoundedButton extends StatelessWidget {
  final Function()? onPressed;
  final String? label;
  final String? heroTag;

  const LoginRoundedButton({
    super.key,
    required this.onPressed,
    this.label,
    this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Hero(
        tag: heroTag ?? AppStrings.kLogin,
        transitionOnUserGestures: true,
        child: AppRoundedButton(
          onPressed: onPressed,
          height: AppSize.s40,
          backgroundColor: ColorManager.primary,
          child: Text(
            label ?? AppStrings.kLogin,
            style: getBoldStyle(
              color: ColorManager.white,
              fontSize: FontSize.s14,
            ),
          ),
        ),
      ),
    );
  }
}
