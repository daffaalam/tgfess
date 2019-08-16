import 'package:flutter_web/material.dart';
import 'package:intl/intl.dart';
import 'package:telegram_menfess/tool/config.dart';
import 'package:telegram_menfess/view/home_content.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String timeNow = DateFormat.H().format(Config.now);
  ThemeData themeTime;
  int recentIndex = 0;

  @override
  void initState() {
    int.parse(timeNow) <= 6 && int.parse(timeNow) > 18
        ? themeTime = ThemeData.light()
        : themeTime = ThemeData.dark();
    super.initState();
  }

  changeIndex(int i) {
    setState(() {
      recentIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Config.appTitle,
      theme: themeTime,
      home: Scaffold(
        appBar: AppBar(
          title: Text(Config.navTitle[recentIndex]),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: ListView.builder(
            itemCount: Config.navTitle.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Container(
                  color: ThemeData().primaryColorDark,
                  child: DrawerHeader(
                    child: Image.network('https://telegram.org/img/t_logo.png'),
                  ),
                );
              } else {
                return ListTile(
                  title: Text(Config.navTitle[index - 1]),
                  onTap: () {
                    changeIndex(index - 1);
                    Navigator.pop(context);
                  },
                  onLongPress: () {
                    changeIndex(index - 1);
                    Navigator.pop(context);
                  },
                );
              }
            },
          ),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: HomeContent(
                index: recentIndex,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
