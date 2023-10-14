import 'package:flutter/material.dart';

class TableRowItem extends StatelessWidget {
  const TableRowItem({required this.values, super.key});

  final List<String> values;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: generateChildren(),
    );
  }

  List<Widget> generateChildren() {
    List<Widget> rowComponents = [];
    for (var element in values) {
      rowComponents.add(Expanded(
          child: Text(
        element,
        textAlign: TextAlign.center,
      )));
    }
    return rowComponents;
  }
}
