import 'package:flutter_web/material.dart';

class AboutView extends StatefulWidget {
  @override
  _AboutViewState createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Divider(),
        Text(
          '~ Telegram Mention Confess ~',
          textAlign: TextAlign.center,
        ),
        Divider(),
        Text(
          'Markdown Support:\n'
          'kamu dapat menggunakan sintaks berikut untuk mengirim pesan\n'
          '- Menebalkan teks: *teks bold*\n'
          '- Memiringkan teks: _teks italic_\n'
          '- Membuat url teks: [teks](http://google.com/)\n'
          '- Menulis kode satu baris: `single line code`\n'
          '- Menulis kode banyak baris:\n'
          '```block_language\n'
          'multi line code block\n'
          '```\n',
        ),
        Divider(),
        Text(
          'Ads:\n'
          'mau belajar pemrogramman menggunakan Flutter, Java, atau yg lainnya? yuk mampir ke @eudekainfo',
        ),
        Divider(),
      ],
    );
  }
}
