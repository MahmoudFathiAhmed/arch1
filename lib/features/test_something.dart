import 'package:arch1/core/shared_widgets/app_slider_view.dart';
import 'package:arch1/core/shared_widgets/base_view_widget.dart';
import 'package:arch1/core/shared_widgets/custom_input_field.dart';
import 'package:arch1/core/shared_widgets/exit_dialog.dart';
import 'package:arch1/core/shared_widgets/gap.dart';
import 'package:arch1/core/shared_widgets/images_grid_view.dart';
import 'package:flutter/cupertino.dart';
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
                IconButton(
                    onPressed: () {
                      exitDialog(context);
                    },
                    icon: const Icon(Icons.exit_to_app))
              ],
            ),
            body: ListView(
              children: [
                AppSliderView(
                  imagesUrls: List.generate(
                      3, (i) => "https://picsum.photos/id/${i + 30}/1200/600"),
                  aspectRatio: 1.8,
                  width: 1.sw,
                  fit: BoxFit.cover,
                ),
                const Gap2(20),
                // SizedImagesGridView(
                //   itemCount: 5,
                //   imageWidth: 250,
                //   imageHeight: 200,
                //   cellAspectRatio: 1,
                //   imagesUrls: List.generate(5, (index)=>"https://picsum.photos/id/${index + 40}/250/200"),
                //   shrinkWrap: true,
                //   primary: false,
                // ),
                CustomInputField(hint: ''),
                const Gap2(20),
                CupertinoTextFormFieldRow(),
                const Gap2(20),
                FlexImagesGridView(
                  itemCount: 5,
                  imagesNumberInRow: 1,
                  cellAspectRatio: 2,
                  imagesUrls: List.generate(5, (index)=>"https://picsum.photos/id/${index + 40}/250/200"),
                  shrinkWrap: true,
                  primary: false,
                  fit: BoxFit.cover,
                ),
                // GridView.builder(
                //   padding: const EdgeInsets.all(18),
                //   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                //       maxCrossAxisExtent: 250,
                //       mainAxisSpacing: 15,
                //       crossAxisSpacing: 15,
                //       childAspectRatio: 1,
                //       mainAxisExtent: 200),
                //   itemBuilder: (context, index) => ImageViewWidget(
                //     width: 250,
                //       cellAspectRatio: 1,
                //       borderRadius: BorderRadius.circular(4),
                //       fit: BoxFit.cover,
                //       boxShadow: const [
                //         BoxShadow(
                //           color: Colors.white,
                //           spreadRadius: .2,
                //           blurRadius: .2,
                //           offset: Offset(0, .5),
                //         ),
                //         BoxShadow(
                //           color: Colors.white,
                //           spreadRadius: .2,
                //           blurRadius: .2,
                //           offset: Offset(.2, 0),
                //         ),
                //         BoxShadow(
                //           color: Colors.white,
                //           spreadRadius: .2,
                //           blurRadius: .2,
                //           offset: Offset(0, -.5),
                //         ),
                //         BoxShadow(
                //           color: Colors.white,
                //           spreadRadius: .2,
                //           blurRadius: .2,
                //           offset: Offset(-.5, 0),
                //         ),
                //       ],
                //       imageUrl: "https://picsum.photos/id/${index + 40}/250/200"),
                //   itemCount: 5,
                //   scrollDirection: Axis.vertical,
                //   shrinkWrap: true,
                //   physics: const NeverScrollableScrollPhysics(),
                // ),
              ],
            )));
  }
}
