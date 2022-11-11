import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:school_app/resources/styles_manager.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
      child: getBuzyPage(color: Theme.of(context).primaryColor),
    );
  }
}
