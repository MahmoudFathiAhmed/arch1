import 'package:arch1/core/shared_widgets/ripple_loading.dart';
import 'package:arch1/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

class AppLoadingWidget extends StatelessWidget {
  const AppLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // return const Center(child: SpinnerLoading());
    return   const Center(child:  RippleLoading(radius: AppDouble.d40,color: Colors.blue,));
    // return   const Center(child:  CircularProgressIndicator());
  }
}
