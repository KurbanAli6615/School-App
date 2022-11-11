import 'package:flutter/material.dart';

import '../../resources/styles_manager.dart';

class AppRoundedButton extends StatelessWidget {
  final Function()? onPressed;
  final double? height;
  final Color? backgroundColor;
  final Widget child;
  final double? elevation;

  const AppRoundedButton({
    super.key,
    required this.onPressed,
    this.height,
    this.elevation,
    this.backgroundColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      elevation: elevation ?? 10,
      shape: getRoundedButtonShape,
      child: MaterialButton(
        height: height,
        // minWidth: 300,
        // elevation: 10,
        shape: getRoundedButtonShape,
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
