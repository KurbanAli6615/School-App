import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:school_app/providers/auth_provider.dart';
import 'package:school_app/resources/routes_manager.dart';
import 'package:school_app/resources/strings_manager.dart';
import 'package:school_app/resources/theme_manager.dart';

const Size mockUpSize = Size(312, 875);
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const SchoolManagementApp());
}

class SchoolManagementApp extends StatelessWidget {
  const SchoolManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        )
      ],
      child: ScreenUtilInit(
        designSize: mockUpSize,
        builder: (context, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStrings.kAppName,
            theme: getApplicationTheme(),
            initialRoute: AppRoutes.splashScreen,
            onGenerateRoute: RouteGenerator.getRoute,
            navigatorKey: RouteGenerator.navigatorKey,
          );
        },
      ),
    );
  }
}
