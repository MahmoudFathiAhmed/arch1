import 'package:arch1/features/bottom_nav_bar/presentation/cubit/bottom_navigation_cubit.dart';
import 'package:arch1/features/bottom_nav_bar/presentation/widgets/bottom_navigation_bar_widget.dart';
import 'package:arch1/features/select_language/presentation/views/select_language_screen.dart';
import 'package:arch1/features/start/presentation/views/start_screen.dart';
import 'package:arch1/features/test_something.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationBarScreen extends StatelessWidget {
  const BottomNavigationBarScreen({
    super.key,
  });

  List<Widget> get bottomNavBarScreens {
    return [
      const TestSomething(),
      const SelectLanguageScreen(),
      const StartScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
      builder: (navContext, navState) {
        // var bottomNavigationCubit = BottomNavigationCubit.get(context);
        return SafeArea(
          child: Scaffold(
            bottomNavigationBar: BottomNavigationBarWidget(
              screenIndex: navState.index,
            ),
            body: bottomNavBarScreens[navState.index],
          ),
        );
      },
    );
  }
}
