part of 'bottom_navigation_cubit.dart';

 class BottomNavigationState extends Equatable {
  final int index;

  const BottomNavigationState({this.index = 0});

  @override
  List<Object> get props => [index];
}
