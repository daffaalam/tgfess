import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/constant.dart';
import 'dialog_report.dart';

class ScaffoldTheme extends StatelessWidget {
  final Widget body;
  final Widget floatingActionButton;

  const ScaffoldTheme({
    Key key,
    this.body,
    this.floatingActionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _alertReport(),
        title: Text(Constant.appName),
        actions: <Widget>[
          this._themeChanger(),
        ],
        backgroundColor: Colors.transparent.withOpacity(0.38),
      ),
      body: this.body ?? Container(),
      floatingActionButton: this.floatingActionButton,
      extendBodyBehindAppBar: true,
    );
  }

  Widget _alertReport() {
    return IconButton(
      padding: EdgeInsets.zero,
      icon: Icon(Icons.report),
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onPressed: () {
        Get.dialog(DialogReport());
      },
      tooltip: "report",
    );
  }

  Widget _themeChanger() {
    return IconButton(
      padding: EdgeInsets.zero,
      icon: Icon(Icons.brightness_7),
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onPressed: () {
        Get.changeThemeMode(
          Get.isDarkMode ? ThemeMode.light : ThemeMode.dark,
        );
      },
      tooltip: "theme",
    );
  }
}
