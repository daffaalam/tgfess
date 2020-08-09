import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldBorder extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextInputType keyboardType;
  final int maxLines;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmitted;
  final bool enabled;
  final bool nullable;

  const TextFieldBorder({
    Key key,
    this.labelText,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.maxLines,
    this.onChanged,
    this.onSubmitted,
    this.enabled = true,
    this.nullable = true,
  }) : super(key: key);

  String get _labelText {
    return nullable ? this.labelText : "${this.labelText} (required)";
  }

  List<TextInputFormatter> get _inputFormatters {
    List<TextInputFormatter> _formatters = <TextInputFormatter>[];
    switch (this.keyboardType.index) {
      case 2:
        _formatters.add(FilteringTextInputFormatter.digitsOnly);
        break;
      case 6:
        _formatters.add(FilteringTextInputFormatter.deny(RegExp(" ")));
        break;
    }
    return _formatters;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: this._labelText,
          hintText: this.hintText,
          border: OutlineInputBorder(),
        ),
        keyboardType: this.keyboardType,
        maxLines: this.maxLines,
        onChanged: this.onChanged,
        onFieldSubmitted: this.onSubmitted,
        inputFormatters: this._inputFormatters,
        enabled: this.enabled,
      ),
    );
  }
}
