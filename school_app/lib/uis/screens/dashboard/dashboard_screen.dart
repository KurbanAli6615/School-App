// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:school_app/resources/routes_manager.dart';
import 'package:school_app/resources/strings_manager.dart';
import 'package:school_app/resources/styles_manager.dart';
import 'package:school_app/resources/values_manager.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../widgets/app_reusable_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.kDashboard,
          style: getBoldStyle(
            color: ColorManager.white,
            fontSize: FontSize.s16,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(AppPadding.p10),
        children: [
          AppReusableCard(
            directionIconHeroTag: AppStrings.kUsers,
            height: AppHeight.h70,
            tileColor: Colors.deepPurpleAccent,
            label: AppStrings.kUsers,
            icon: Icons.supervised_user_circle,
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.usersScreen);
            },
          ),
          AppReusableCard(
            directionIconHeroTag: AppStrings.kNotifications,
            height: AppHeight.h70,
            tileColor: Colors.orangeAccent,
            label: AppStrings.kNotifications,
            icon: Icons.notifications,
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.notificationsScreen);
            },
          ),
        ],
      ),
    );
  }
}
