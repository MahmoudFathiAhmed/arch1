import 'package:arch1/features/bottom_navigation_bar/export/bottom_navigation_export.dart';
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
