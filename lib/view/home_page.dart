import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../network/telegram_client.dart';
import '../widget/scaffold_theme.dart';
import '../widget/text_field_border.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _message;
  bool _sendAsMessage = true;
  String _imageUrl;
  int _replyId;
  bool _sending = false;

  void _sendingMessage() async {
    _sending = true;
    setState(() {});
    bool _success = true;
    if (_imageUrl?.isNotEmpty ?? false) {
      _success = await TelegramClient.sendPhoto(
        _imageUrl,
        caption: _message,
        replyId: _replyId,
      );
    } else {
      _success = await TelegramClient.sendMessage(
        _message,
        replyId: _replyId,
      );
    }
    if (!_success) _failedSending();
    _sending = false;
    setState(() {});
  }

  void _failedSending() {
    Get.dialog(
      AlertDialog(
        title: Center(
          child: Text("Failed To Send"),
        ),
        titlePadding: EdgeInsets.all(16.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldTheme(
      body: ListView(
        padding: EdgeInsets.only(
          left: 8.0,
          top: kToolbarHeight + 8.0,
          right: 8.0,
          bottom: 8.0,
        ),
        children: <Widget>[
          TextFieldBorder(
            labelText: _sendAsMessage ? "Message" : "Caption",
            enabled: !_sending,
            onChanged: (String message) {
              _message = message;
            },
            nullable: !_sendAsMessage,
          ),
          TextFieldBorder(
            labelText: "Image Url",
            keyboardType: TextInputType.url,
            onChanged: (String imageUrl) {
              _imageUrl = imageUrl;
              _sendAsMessage = _imageUrl.isEmpty;
              setState(() {});
            },
            enabled: !_sending,
            nullable: _sendAsMessage,
          ),
          TextFieldBorder(
            labelText: "Reply ID",
            keyboardType: TextInputType.number,
            maxLines: 1,
            onChanged: (String replyId) {
              _replyId = int.tryParse(replyId);
            },
            enabled: !_sending,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        tooltip: "send",
        onPressed: _sending ? null : _sendingMessage,
        icon: Icon(_sending ? Icons.loop : Icons.send),
        label: Text(_sending ? "SENDING..." : "SEND"),
      ),
    );
  }
}
