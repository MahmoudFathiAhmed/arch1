import 'package:arch1/core/shared_widgets/drop_down_menu.dart';
import 'package:flutter/material.dart';

class TestSomething extends StatelessWidget {
  const TestSomething({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> items = [
      'One',
      'Two',
      'Three',
      'Four',
      'Five',
      'Six',
      'Seven',
      'Eight',
      'Nine',
      'Ten',
      'Eleven',
      'Twelve',
      'Thirteen',
    ];
    return Scaffold(
      appBar: AppBar(title: Text('Custom DropdownButton')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomDropdownButton<String>(
            itemsList: items,
            icon: Icons.expand_more,
            hint: 'Select an option',
            dropDownItemChange: (value) {
              print('Selected: $value');
            },
            dropDownItemName: (String a) {
              return a;
            },
          ),
        ),
      ),
    );
  }
}
