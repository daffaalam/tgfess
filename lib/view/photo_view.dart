import 'dart:html';

import 'package:flutter_web/material.dart';
import 'package:telegram_menfess/model/req_photo.dart';
import 'package:telegram_menfess/model/res_photo.dart';
import 'package:telegram_menfess/tool/api_client.dart';
import 'package:telegram_menfess/tool/config.dart';
import 'package:telegram_menfess/tool/fun.dart';
import 'package:telegram_menfess/view/input_text.dart';

class SendPhotoView extends StatefulWidget {
  @override
  _SendPhotoViewState createState() => _SendPhotoViewState();
}

class _SendPhotoViewState extends State<SendPhotoView> {
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerUrlPhoto = TextEditingController();
  TextEditingController controllerCaption = TextEditingController();
  TextEditingController controllerReply = TextEditingController();
  bool editable = true;
  ReqPhoto reqPhoto;
  ResPhoto resPhoto;

  sendPhoto() async {
    if (controllerUsername.text.isNotEmpty &&
        controllerUrlPhoto.text.isNotEmpty) {
      setState(() {
        editable = false;
      });
      reqPhoto = ReqPhoto(
        chatId: '@${Config.username}',
        photo: controllerUrlPhoto.text,
        caption: controllerCaption.text,
        reply_to_message_id: controllerReply.text,
      );
      resPhoto = await ApiClient.sendPhoto(
        body: reqPhoto.toMap(),
      );
      setState(() {
        editable = true;
      });
      if (resPhoto.ok) {
        window.open(Config.urlChannel, Config.appTitle);
      } else {
        Fun.onError(context, 'Gagal Terkirim.', resPhoto.description);
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
          controller: controllerUrlPhoto,
          inputType: TextInputType.url,
          maxLines: 1,
          notNull: true,
          enable: editable,
          label: 'URL Photo',
        ),
        InputText(
          controller: controllerCaption,
          inputType: TextInputType.multiline,
          maxLines: 5,
          enable: editable,
          label: 'Caption',
        ),
        InputText(
          controller: controllerReply,
          inputType: TextInputType.number,
          maxLines: 1,
          enable: editable,
          label: 'ID Pesan',
          help: 'id pesan yang ingin di reply',
        ),
        RaisedButton.icon(
          icon: Icon(editable ? Icons.send : Icons.close),
          label: Text(editable ? 'SEND' : 'SENDING...'),
          onPressed: () {
            sendPhoto();
          },
        ),
      ],
    );
  }
}
