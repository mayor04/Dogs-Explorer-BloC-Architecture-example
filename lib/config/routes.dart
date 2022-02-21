import 'package:dog_app/view/intro/intro_view.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String intro = '/';
  static const String explore = '/explore';
  static const String breedDetails = '/details';
  static const String saved = '/saved';

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case intro:
        return MaterialPageRoute(builder: (_) => const IntroView());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('No Route Found')),
          ),
        );
    }
  }
}
