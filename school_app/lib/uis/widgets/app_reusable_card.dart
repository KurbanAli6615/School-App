import 'package:flutter/material.dart';
import 'package:school_app/resources/color_manager.dart';
import 'package:school_app/resources/font_manager.dart';
import 'package:school_app/resources/styles_manager.dart';
import 'package:school_app/resources/values_manager.dart';

class AppReusableCard extends StatelessWidget {
  final Function()? onPressed;
  final String label;
  final IconData? icon;
  final double? height;
  final IconData? directionIcon;
  final Color tileColor;
  final String? directionIconHeroTag;

  const AppReusableCard({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.label,
    required this.tileColor,
    this.height,
    this.directionIcon,
    this.directionIconHeroTag,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppPadding.p5),
      child: Container(
        color: tileColor,
        child: MaterialButton(
          minWidth: AppWidth.w100Percent,
          height: height ?? AppHeight.h90,
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(
                icon,
                size: AppSize.s35,
                color: ColorManager.white,
              ),
              Text(
                label,
                maxLines: 2,
                style: getSemiBoldStyle(
                  fontSize: FontSize.s18,
                  color: ColorManager.white,
                ),
              ),
              Hero(
                tag: directionIconHeroTag ?? '',
                transitionOnUserGestures: true,
                child: Icon(
                  directionIcon ?? Icons.chevron_right,
                  color: ColorManager.white,
                  size: AppSize.s35,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
