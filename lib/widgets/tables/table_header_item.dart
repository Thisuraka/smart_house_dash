import 'package:flutter/material.dart';

class TableHeaderItem extends StatelessWidget {
  const TableHeaderItem({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          content,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
