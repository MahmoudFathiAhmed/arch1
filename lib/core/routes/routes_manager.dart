import 'package:arch1/modules/splash/presentation/views/splash_screen.dart';
import 'package:arch1/modules/start/presentation/views/start_screen.dart';
import 'package:flutter/material.dart';


class Routes {
  static const String initialRoute = '/';
  static const String splashRoute = '/splashRoute';
  static const String onBoardingRoute = '/onBoardingRoute';
  static const String startRoute = '/startRoute';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.startRoute:
        return MaterialPageRoute(builder: (_) => const StartScreen());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const StartScreen());
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}