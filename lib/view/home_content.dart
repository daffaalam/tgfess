import 'package:flutter_web/material.dart';
import 'package:telegram_menfess/view/about_view.dart';
import 'package:telegram_menfess/view/message_view.dart';
import 'package:telegram_menfess/view/photo_view.dart';
import 'package:telegram_menfess/view/report_error_view.dart';

class HomeContent extends StatefulWidget {
  final int index;

  HomeContent({this.index});

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    switch (widget.index) {
      case 0:
        return AboutView();
        break;
      case 1:
        return SendMessageView();
        break;
      case 2:
        return SendPhotoView();
        break;
      case 3:
      default:
        return ReportErrorView();
        break;
    }
  }
}
