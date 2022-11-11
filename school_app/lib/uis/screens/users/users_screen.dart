import 'package:flutter/material.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/styles_manager.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.kUsers,
          style: getBoldStyle(
            color: ColorManager.white,
            fontSize: FontSize.s16,
          ),
        ),
      ),
      body: Container(),
    );
  }
}
