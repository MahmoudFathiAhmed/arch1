import 'package:arch1/features/bottom_nav_bar/presentation/cubit/bottom_navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int screenIndex;
  final double radius = 20.0;
  final List<BoxShadow>? boxShadow;

  const BottomNavigationBarWidget({
    super.key,
    required this.screenIndex,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(radius),
            topLeft: Radius.circular(radius),
          ),
          boxShadow: boxShadow),
      child: ClipRRect(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          currentIndex: screenIndex,
          useLegacyColorScheme: false,
          items: [
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: screenIndex == 0
                      ? const Icon(Icons.home)
                      : const Icon(Icons.home_outlined),
                ),
                label: 'home'),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: screenIndex == 1
                    ? const Icon(Icons.shopping_cart)
                    : const Icon(Icons.shopping_cart_outlined),
              ),
              label: 'cart',
            ),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: screenIndex == 2
                      ? const Icon(Icons.settings)
                      : const Icon(Icons.settings_outlined),
                ),
                label: 'settings'),
          ],
          onTap: (index) {
            print(index);
            context.read<BottomNavigationCubit>().changeScreen(index);
          },
        ),
      ),
    );
  }
}
