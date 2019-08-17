import 'package:flutter_web/material.dart';
import 'package:telegram_menfess/tool/config.dart';

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
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text('\n'),
        Divider(),
        Text(
          '\n'
          'Cara Penggunaan:'
          '\n'
          'Kamu bisa langsung buka halaman kirim pesan di menu pojok kiri atas, kemudian isi username Telegram kamu dan pesannya, lalu jika terdapat link, kamu bisa pilih apakah pesan akan menampilkan link preview atau tidak.'
          '\n\n',
        ),
        Divider(),
        Text(
          '\n'
          'Markdown Support:\n'
          'kamu dapat menggunakan sintaks berikut untuk mengirim pesan\n'
          '- Menebalkan teks: *teks bold*\n'
          '- Memiringkan teks: _teks italic_\n'
          '- Membuat url teks: [teks](http://google.com/)\n'
          '- Menulis kode satu baris: `single line code`\n'
          '- Menulis kode banyak baris:\n'
          '```block_language\n'
          'multi line code block\n'
          '```'
          '\n\n',
        ),
        Divider(),
        Text(
          '\n'
          'Ads:\n'
          'mau belajar pemrogramman menggunakan Flutter, Java, atau yg lainnya? yuk mampir ke @eudekainfo'
          '\n\n',
        ),
        Divider(),
        Text('version: ${Config.appVersion}'),
        Divider(),
      ],
    );
  }
}
