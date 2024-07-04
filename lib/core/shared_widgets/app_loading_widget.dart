import 'package:arch1/core/shared_widgets/ripple_loading.dart';
import 'package:flutter/material.dart';

class AppLoadingWidget extends StatelessWidget {
  const AppLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // return const Center(child: SpinnerLoading());
    return   const Center(child:  RippleLoading(radius: 40,color: Colors.blue,));
    // return   const Center(child:  CircularProgressIndicator());
  }
}
