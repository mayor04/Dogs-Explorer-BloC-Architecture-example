import 'package:dog_app/core/constant/strings.dart';
import 'package:dog_app/view/intro/intro_view.dart';
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: AppTheme.darkTheme,
      home: const IntroView(),
      onGenerateRoute: AppRoutes.generateRoutes,
    );
  }
}
