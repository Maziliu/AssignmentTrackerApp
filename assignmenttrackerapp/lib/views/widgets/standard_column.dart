import 'package:flutter/material.dart';

class StandardColumn extends StatelessWidget {
  final List<Widget> _children;
  const StandardColumn({super.key, required List<Widget> children})
      : _children = children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: addSpacing(_children),
      ),
    );
  }

  List<Widget> addSpacing(List<Widget> children) {
    if (children.isEmpty) return [];

    return [
      for (int i = 0; i < children.length; i++) ...[
        children[i],
        if (i < children.length - 1) SizedBox(height: 20)
      ]
    ];
  }
}
