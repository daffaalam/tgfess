import 'dart:html';

import 'package:flutter_web/material.dart';
import 'package:telegram_menfess/model/req_message.dart';
import 'package:telegram_menfess/model/res_message.dart';
import 'package:telegram_menfess/tool/api_client.dart';
import 'package:telegram_menfess/tool/config.dart';
import 'package:telegram_menfess/tool/fun.dart';
import 'package:telegram_menfess/view/input_text.dart';

class SendMessageView extends StatefulWidget {
  @override
  SendMessageViewState createState() => SendMessageViewState();
}

class SendMessageViewState extends State<SendMessageView> {
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerText = TextEditingController();
  TextEditingController controllerReply = TextEditingController();
  bool editable = true;
  ReqMessage reqMessage;
  ResMessage resMessage;
  bool preview = true;

  sendMessage() async {
    if (controllerUsername.text.isNotEmpty && controllerText.text.isNotEmpty) {
      setState(() {
        editable = false;
      });
      reqMessage = ReqMessage(
        chatId: '@${Config.username}',
        text: controllerText.text,
        disableWebPagePreview: '$preview',
        reply_to_message_id: controllerReply.text,
      );
      resMessage = await ApiClient.sendMessage(
        body: reqMessage.toMap(),
      );
      setState(() {
        editable = true;
      });
      if (resMessage.ok) {
        window.open(Config.urlChannel, Config.appTitle);
      } else {
        Fun.onError(context, 'Gagal Terkirim.', resMessage.description);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        InputText(
          controller: controllerUsername,
          inputType: TextInputType.text,
          maxLines: 1,
          notNull: true,
          enable: editable,
          label: 'Username Telegram',
        ),
        InputText(
          controller: controllerText,
          inputType: TextInputType.multiline,
          maxLines: 5,
          notNull: true,
          enable: editable,
          label: 'Message',
        ),
        InputText(
          controller: controllerReply,
          inputType: TextInputType.number,
          maxLines: 1,
          enable: editable,
          label: 'ID Pesan',
          help: 'id pesan yang ingin di reply',
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text('Link Preview'),
              Switch(
                value: preview,
                onChanged: (bool value) {
                  setState(() {
                    preview = value;
                  });
                },
              ),
            ],
          ),
        ),
        RaisedButton.icon(
          icon: Icon(editable ? Icons.send : Icons.close),
          label: Text(editable ? 'SEND' : 'SENDING...'),
          onPressed: () {
            sendMessage();
          },
        ),
      ],
    );
  }
}
