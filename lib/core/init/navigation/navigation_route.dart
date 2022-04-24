import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../view/home/view/home_view.dart';
import '../../../view/splash/view/splash_view.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.SPLASH:
        return normalNavigate(SplashView());

      case NavigationConstants.HOME:
        return normalNavigate(HomeView());

      default:
        return normalNavigate(SplashView());
    }
  }

  MaterialPageRoute normalNavigate(
    Widget widget,
  ) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
