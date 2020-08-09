import 'package:dio/dio.dart';

import '../config/constant.dart';

class TelegramClient {
  static final Uri _uri = Uri.https(
    "api.telegram.org",
    "/bot${Constant.botToken}",
  );

  static final Map<String, dynamic> _query = <String, dynamic>{
    "chat_id": "@${Constant.channelName}",
    "parse_mode": "Markdown",
  };

  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "$_uri",
      headers: <String, dynamic>{
        Headers.contentTypeHeader: "multipart/form-data",
      },
    ),
  );

  static Future<bool> sendReport(String message) async {
    if (message == null || message.isEmpty) return false;
    _query.update("chat_id", (value) => Constant.adminId);
    bool _success = await sendMessage("#report\n\n$message");
    return _success;
  }

  static Future<bool> sendMessage(
    String message, {
    bool webPreview = true,
    int replyId,
  }) async {
    _query.addAll(
      <String, dynamic>{
        "text": message,
        "disable_web_page_preview": webPreview,
        "reply_to_message_id": replyId,
      },
    );
    try {
      await _dio.post(
        "/sendMessage",
        data: FormData.fromMap(_query),
      );
      return true;
    } catch (e) {
      print("[ERROR] : $e");
      return false;
    }
  }

  static Future<bool> sendPhoto(
    dynamic photo, {
    String caption,
    int replyId,
  }) async {
    _query.addAll(
      <String, dynamic>{
        "photo": photo,
        "caption": caption,
        "reply_to_message_id": replyId,
      },
    );
    try {
      await _dio.post(
        "/sendPhoto",
        data: FormData.fromMap(_query),
      );
      return true;
    } catch (e) {
      print("[ERROR] : $e");
      return false;
    }
  }
}
