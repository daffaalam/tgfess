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
          '~ ${Config.appTitle} ~',
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
          'Cara Penggunaan!'
          '\n',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '- Kamu bisa langsung buka halaman kirim pesan (Message dan Photo) di menu pojok kiri atas.'
          '\n'
          '- Isi username Telegram kamu dan pesannya.'
          '\n'
          '- Jika terdapat link pada pesan, kamu bisa pilih apakah pesan akan menampilkan link preview atau tidak.'
          '\n'
          '- Untuk fitur gambar saat ini hanya bisa mengirim menggunakan url.'
          '\n'
          '- Copy link gambar yang ingin kamu kirim kemudian paste ke dalam form tersebut.'
          '\n'
          '- Untuk label/hint yang berwana merah artinya form tersebut wajib diisi.'
          '\n\n',
        ),
        Divider(),
        Text(
          '\n'
          'Markdown Support!'
          '\n',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
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
          'Untuk kritik, saran, support, dan lainnya silahkan gunakan fitur Report Error.'
          '\n\n',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Divider(),
        Text(
          '\n'
          'Iklan!'
          '\n',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'mau belajar pemrogramman menggunakan Flutter, Java, atau yg lainnya? yuk mampir ke @eudekainfo'
          '\n\n',
        ),
        Divider(),
        Text(
          '\n'
          'version: ${Config.appVersion}',
          style: TextStyle(
            fontStyle: FontStyle.italic,
          ),
        ),
        Divider(),
      ],
    );
  }
}
