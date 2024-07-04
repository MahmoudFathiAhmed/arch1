import 'package:arch1/features/bottom_nav_bar/presentation/views/bottom_navigation_bar_screen.dart';
import 'package:arch1/features/select_language/presentation/views/select_language_screen.dart';
import 'package:arch1/features/start/presentation/views/start_screen.dart';
import 'package:flutter/material.dart';


class Routes {
  static const String initialRoute = '/';
  static const String onBoardingRoute = '/onBoardingRoute';
  static const String startRoute = '/startRoute';
  static const String loginRoute = '/loginRoute';
  static const String selectLanguageRoute = '/selectLanguageRoute';
  static const String bottomNavigationBarRoute = '/bottomNavigationBarRoute';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.initialRoute:
        // return MaterialPageRoute(builder: (_) => const StartScreen());
        // return MaterialPageRoute(builder: (_) => const SelectLanguageScreen());
        return MaterialPageRoute(builder: (_) => const BottomNavigationBarScreen());
      case Routes.startRoute:
        return MaterialPageRoute(builder: (_) => const StartScreen());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const StartScreen());
      case Routes.selectLanguageRoute:
        return MaterialPageRoute(builder: (_) => const SelectLanguageScreen());
      case Routes.bottomNavigationBarRoute:
        return MaterialPageRoute(builder: (_) => const BottomNavigationBarScreen());

      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}