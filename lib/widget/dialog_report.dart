import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../network/telegram_client.dart';
import 'text_field_border.dart';

class DialogReport extends StatefulWidget {
  @override
  _DialogReportState createState() => _DialogReportState();
}

class _DialogReportState extends State<DialogReport> {
  String _message;
  String _label = "SEND";
  bool _sending = false;
  bool _success = true;

  void _sendingReport() async {
    _label = "SENDING...";
    _sending = true;
    setState(() {});
    _success = await TelegramClient.sendReport(_message);
    _label = _success ? "Thanks for the report" : "Failed to send the report";
    setState(() {});
    await Future.delayed(Duration(seconds: 2));
    _label = "SEND";
    _sending = false;
    setState(() {});
    if (_success) Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Report To Admin",
        textAlign: TextAlign.center,
      ),
      titlePadding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
      content: TextFieldBorder(
        onChanged: (String message) {
          _message = message;
        },
        enabled: !_sending,
      ),
      contentPadding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
      actions: <Widget>[
        OutlineButton(
          onPressed: _sending ? null : _sendingReport,
          child: Container(
            alignment: Alignment.center,
            child: Text(_label),
          ),
        ),
      ],
      actionsPadding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
    );
  }
}
