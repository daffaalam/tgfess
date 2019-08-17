import 'package:http/http.dart';
import 'package:telegram_menfess/model/res_message.dart';
import 'package:telegram_menfess/model/res_photo.dart';
import 'package:telegram_menfess/tool/config.dart';

class ApiClient {
  static Future<ResMessage> sendMessage({Map body}) async {
    Response response = await post('${Config.baseUrl}/sendMessage', body: body);
    return ResMessage.fromJson(response.body);
  }

  static Future<ResPhoto> sendPhoto({Map body}) async {
    Response response = await post('${Config.baseUrl}/sendPhoto', body: body);
    return ResPhoto.fromJson(response.body);
  }
}
