import 'dart:html';

import 'package:flutter_web/material.dart';
import 'package:telegram_menfess/model/req_message.dart';
import 'package:telegram_menfess/model/res_message.dart';
import 'package:telegram_menfess/tool/api_client.dart';
import 'package:telegram_menfess/tool/config.dart';
import 'package:telegram_menfess/view/input_text.dart';

class ReportErrorView extends StatefulWidget {
  @override
  ReportErrorViewState createState() => ReportErrorViewState();
}

class ReportErrorViewState extends State<ReportErrorView> {
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerText = TextEditingController();
  bool editable = true;
  ReqMessage reqMessage;
  ResMessage resMessage;

  popUpDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(message),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  sendMessage() async {
    setState(() {
      editable = false;
    });
    reqMessage = ReqMessage(
      chatId: Config.idAdmin,
      text:
          '*REPORT!*\n\n${controllerText.text}\n\n@${controllerUsername.text}',
    );
    resMessage = await ApiClient.sendMessage(
      body: reqMessage.toMap(),
    );
    setState(() {
      editable = true;
    });
    if (resMessage.ok) {
      popUpDialog(
          'Pesan berhasil terkirim.\nTerimakasih atas laporannya, kami akan segera mengatasinya secepat mungkin.');
    } else {
      popUpDialog(resMessage.description);
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
          enable: editable,
          label: 'Username Telegram',
        ),
        InputText(
          controller: controllerText,
          inputType: TextInputType.multiline,
          maxLines: 10,
          enable: editable,
          label: 'Error Message',
          help: 'jelaskan secara rinci error yang terjadi.',
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
