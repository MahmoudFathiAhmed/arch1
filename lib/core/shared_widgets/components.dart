//Gap
import 'package:flutter/material.dart';

class Gap extends StatelessWidget {
  final double space;

  const Gap(
      this.space, {
        super.key,
      });

  @override
  Widget build(BuildContext context) {
    final parentWidget = context.findAncestorWidgetOfExactType<Row>() ??
        context.findAncestorWidgetOfExactType<Column>();
    final isRow = parentWidget is Row;
    return SizedBox(width: isRow ? space : null, height: isRow ? null : space);
  }
}
