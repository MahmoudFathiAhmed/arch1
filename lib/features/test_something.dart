import 'package:arch1/core/extensions/extenstions.dart';
import 'package:arch1/core/shared_widgets/base_view_widget.dart';
import 'package:arch1/core/shared_widgets/custom_drawer.dart';
import 'package:arch1/core/shared_widgets/shimmer_loading_parser.dart';
import 'package:arch1/core/utils/enum.dart';
import 'package:flutter/material.dart';

class TestSomething extends StatefulWidget {
  const TestSomething({super.key});

  @override
  State<TestSomething> createState() => _TestSomethingState();
}

class _TestSomethingState extends State<TestSomething> {

  @override
  Widget build(BuildContext context) {
    return BaseViewWidget(
      appBar: AppBar(backgroundColor: Colors.blue,),
        drawer: const CustomDrawer(items: [],),
        hasRefresh: true,
        onRefreshListener: ()async{
        print('x');
        return true;
        },
        body: ShimmerLoadingParser(
          orientation: ViewOrientation.orientationGrid,
          cellWidth: context.width*.4,
          cellAspectRatio: 1,
          margin: 4,
          padding: 18,
          radius: 8,
          baseColor: Colors.grey,
          scrollDirection: Axis.vertical,
          highlightColor: Colors.white,
        ));
  }
}
