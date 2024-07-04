import 'package:arch1/core/shared_widgets/base_view_widget.dart';
import 'package:arch1/core/shared_widgets/custom_drawer.dart';
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
        body: Text('mahmoud',style: TextStyle(color: Colors.white),));
  }
}
