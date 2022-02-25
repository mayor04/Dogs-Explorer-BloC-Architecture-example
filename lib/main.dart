import 'package:dog_app/core/constant/strings.dart';
import 'package:dog_app/features/view/intro_view.dart';
import 'package:dog_app/services/navigation_services.dart';
import 'package:flutter/material.dart';

import 'config/routes.dart';
import 'config/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      darkTheme: AppTheme.darkTheme,
      home: const IntroView(),
      navigatorKey: NavigationService().navigatorKey,
      onGenerateRoute: AppRoutes.generateRoutes,
    );
  }
}
