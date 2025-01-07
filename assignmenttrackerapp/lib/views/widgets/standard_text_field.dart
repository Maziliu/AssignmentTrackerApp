import 'package:flutter/material.dart';

class StandardTextField extends StatelessWidget {
  final String _labelText;
  final TextEditingController _controller;
  const StandardTextField(
      {super.key,
      required String labelText,
      required TextEditingController controller})
      : _labelText = labelText,
        _controller = controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
        labelText: _labelText,
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
    );
  }
}
