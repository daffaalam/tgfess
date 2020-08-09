import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'config/constant.dart';
import 'view/home_page.dart';

void main() {
  for (var e in querySelectorAll(".progress")) e.remove();
  runApp(
    MainApp(),
  );
}

class MainApp extends StatelessWidget {
  final List<GetPage> _getPages = <GetPage>[
    GetPage(
      name: Constant.homeRoute,
      page: () {
        return HomePage();
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Constant.appName,
      theme: ThemeData.light().copyWith(
        platform: TargetPlatform.iOS,
        buttonBarTheme: ButtonBarThemeData(
          alignment: MainAxisAlignment.center,
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        platform: TargetPlatform.iOS,
        buttonBarTheme: ButtonBarThemeData(
          alignment: MainAxisAlignment.center,
        ),
      ),
      getPages: _getPages,
    );
  }
}
