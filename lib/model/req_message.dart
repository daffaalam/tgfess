import 'dart:convert';

class ReqMessage {
  String chatId;
  String text;
  String parseMode;
  String disableWebPagePreview;

  ReqMessage({
    this.chatId,
    this.text,
    this.parseMode = 'markdown',
    this.disableWebPagePreview = 'true',
  });

  factory ReqMessage.fromJson(String str) =>
      ReqMessage.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReqMessage.fromMap(Map<String, dynamic> json) => ReqMessage(
        chatId: json["chat_id"] == null ? null : json["chat_id"],
        text: json["text"] == null ? null : json["text"],
        parseMode: json["parse_mode"] == null ? null : json["parse_mode"],
        disableWebPagePreview: json["disable_web_page_preview"] == null
            ? null
            : json["disable_web_page_preview"],
      );

  Map<String, dynamic> toMap() => {
        "chat_id": chatId == null ? null : chatId,
        "text": text == null ? null : text,
        "parse_mode": parseMode == null ? null : parseMode,
        "disable_web_page_preview":
            disableWebPagePreview == null ? null : disableWebPagePreview,
      };
}
