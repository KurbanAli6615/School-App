import 'package:flutter/material.dart';
import 'package:school_app/resources/color_manager.dart';
import 'package:school_app/resources/strings_manager.dart';
import 'package:school_app/resources/styles_manager.dart';
import 'package:school_app/uis/screens/auth/auth_screen.dart';
import 'package:school_app/uis/screens/dashboard/dashboard_screen.dart';
import 'package:school_app/uis/screens/notifications/notifications_screen.dart';
import 'package:school_app/uis/screens/users/users_screen.dart';

import '../uis/screens/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = '/';
  static const String authScreen = '/auth';
  static const String dashboardScreen = '/dashboard';
  static const String notificationsScreen = '/notifications';
  static const String usersScreen = '/users';

  static void popUntil(
    BuildContext context, {
    required String name,
    Object? arguments,
  }) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      name,
      (_) => false,
      arguments: arguments,
    );
  }

  static void popTo(BuildContext context, {required String name}) {
    Navigator.of(context).popUntil(ModalRoute.withName(name));
  }
}

class RouteGenerator {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.splashScreen:
        return _buildRouteScreen(
          name: routeSettings.name,
          child: const SplashScreen(),
        );
      case AppRoutes.authScreen:
        return _buildRouteScreen(
          name: routeSettings.name,
          child: const AuthScreen(),
        );
      case AppRoutes.dashboardScreen:
        return _buildRouteScreen(
          name: routeSettings.name,
          child: const DashboardScreen(),
        );
      case AppRoutes.notificationsScreen:
        return _buildRouteScreen(
          name: routeSettings.name,
          child: const NotificationsScreen(),
        );
      case AppRoutes.usersScreen:
        return _buildRouteScreen(
          name: routeSettings.name,
          child: const UsersScreen(),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return _buildRouteScreen(
      child: Scaffold(
        body: Center(
          child: Text(
            AppStrings.kNoRouteFound,
            style: getMediumStyle(color: ColorManager.white),
          ),
        ),
      ),
    );
  }

  static MaterialPageRoute<dynamic> _buildRouteScreen({
    String? name,
    required Widget child,
  }) {
    return MaterialPageRoute<dynamic>(
      settings: RouteSettings(name: name),
      builder: (_) => child,
    );
  }
}
