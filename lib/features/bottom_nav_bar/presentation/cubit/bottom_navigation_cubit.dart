import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_navigation_state.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super( const BottomNavigationState());

  static BottomNavigationCubit get(context) => BlocProvider.of(context);

  changeScreen(int index) => emit(BottomNavigationState(index: index));
}
/*
        /// Usage in Widget:

        //  BottomNavigationCubit cubit = BlocProvider.of<BottomNavigationCubit>(context);

        //  cubit.changeIndex(2); // Update state (index = 2)
*/