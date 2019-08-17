import 'package:flutter_web/material.dart';
import 'package:flutter_web/widgets.dart';

class InputText extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType inputType;
  final int maxLength;
  final int maxLines;
  final bool enable;
  final bool notNull;
  final String label;
  final String help;

  InputText({
    this.controller,
    this.inputType,
    this.maxLength,
    this.maxLines,
    this.enable = true,
    this.notNull = false,
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
          labelText: notNull ? '$label *' : label,
          labelStyle: notNull ? TextStyle(color: Colors.red) : null,
          alignLabelWithHint: true,
          helperText: help,
        ),
      ),
    );
  }
}
