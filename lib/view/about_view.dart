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
          '\n'
          '\n',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '- Kamu bisa langsung buka halaman kirim pesan (Message dan Photo) di menu pojok kiri atas.'
          '\n'
          '\n'
          '- Isi username Telegram kamu dan pesannya.'
          '\n'
          '\n'
          '- Jika terdapat link pada pesan, kamu bisa pilih apakah pesan akan menampilkan link preview atau tidak.'
          '\n'
          '\n'
          '- Untuk fitur gambar saat ini hanya bisa mengirim menggunakan url.'
          '\n'
          '\n'
          '- Copy link gambar yang ingin kamu kirim kemudian paste ke dalam form tersebut.'
          '\n'
          '\n'
          '- Untuk mereply menfess yg sudah ada, kamu cukup copy link menfess tersebut, lalu ambil nomornya saja (contoh: https://t.me/tgfess/100 == 100).'
          '\n'
          '\n'
          '- Untuk label/hint yang berwana merah artinya form tersebut wajib diisi.'
          '\n'
          '\n'
          '- Semua yg kamu kirim akan langsung di teruskan ke Channel, kami tidak menyimpan apapun dari anda sedikitpun termasuk username dan pesan anda.'
          '\n'
          '\n'
          '- Kami tidak bertanggung jawab atas semua konten yg anda kirimkan.'
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
          'Kamu dapat menggunakan sintaks berikut untuk mengirim pesan\n'
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
          'Mau belajar pemrogramman menggunakan Flutter, Java, atau yg lainnya? yuk mampir ke @eudekainfo'
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
