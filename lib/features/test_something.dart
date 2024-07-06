import 'package:arch1/core/shared_widgets/app_slider_view.dart';
import 'package:arch1/core/shared_widgets/base_view_widget.dart';
import 'package:arch1/core/shared_widgets/exit_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestSomething extends StatefulWidget {
  const TestSomething({super.key});

  @override
  State<TestSomething> createState() => _TestSomethingState();
}

class _TestSomethingState extends State<TestSomething> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (popInvocation) {
        exitDialog(context);
      },
      child: BaseViewWidget(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            actions: [
              IconButton(onPressed: (){
                exitDialog(context);
              }, icon: const Icon(Icons.exit_to_app))
            ],
          ),
          body: Column(
            children: [
              AppSliderView(
                imagesUrls: List.generate(3, (i) => "https://picsum.photos/id/${i+30}/1200/600"),
                aspectRatio: 1.8,
                width: 1.sw,
                fit: BoxFit.cover,
              )
            ],
          ))
    );
  }


}
