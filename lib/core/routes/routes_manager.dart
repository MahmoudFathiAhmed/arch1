import 'package:arch1/features/select_language/presentation/views/select_language_screen.dart';
import 'package:arch1/features/start/presentation/views/start_screen.dart';
import 'package:arch1/features/test_something.dart';
import 'package:flutter/material.dart';


class Routes {
  static const String initialRoute = '/';
  static const String onBoardingRoute = '/onBoardingRoute';
  static const String startRoute = '/startRoute';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.initialRoute:
        // return MaterialPageRoute(builder: (_) => const StartScreen());
        return MaterialPageRoute(builder: (_) => const SelectLanguageScreen());
      case Routes.startRoute:
        return MaterialPageRoute(builder: (_) => const StartScreen());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const StartScreen());

      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}