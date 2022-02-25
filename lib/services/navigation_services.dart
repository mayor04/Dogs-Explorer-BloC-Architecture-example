import 'package:dog_app/config/routes.dart';
import 'package:flutter/material.dart';

class NavigationService {
  static final NavigationService _instance = NavigationService._();

  factory NavigationService() {
    return _instance;
  }

  NavigationService._();

  final navigatorKey = GlobalKey<NavigatorState>();

  //View navigation
  Future<dynamic>? navigateToExploreView() {
    return _navigateToNamed(AppRoutes.explore);
  }

  Future<dynamic>? navigateToDetailsView() {
    return _navigateToNamed(AppRoutes.breedDetails);
  }

  Future<T?>? _navigateTo<T>(Route<T> route) {
    return navigatorKey.currentState?.push(route);
  }

  Future<T?>? _navigateToNamed<T>(String route, {Object? args}) {
    return navigatorKey.currentState?.pushNamed(route, arguments: args);
  }
}
