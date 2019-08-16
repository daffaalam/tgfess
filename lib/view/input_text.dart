import 'package:flutter_web/material.dart';
import 'package:flutter_web/widgets.dart';

class InputText extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType inputType;
  final int maxLength;
  final int maxLines;
  final bool enable;
  final String label;
  final String help;

  InputText({
    this.controller,
    this.inputType,
    this.maxLength,
    this.maxLines,
    this.enable,
    this.label,
    this.help,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        maxLength: maxLength,
        maxLines: maxLines,
        enabled: enable,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
          alignLabelWithHint: true,
          helperText: help,
        ),
      ),
    );
  }
}