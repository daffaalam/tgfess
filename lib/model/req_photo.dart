import 'dart:convert';

class ReqPhoto {
  String chatId;
  String photo;
  String caption;
  String parseMode;

  ReqPhoto({
    this.chatId,
    this.photo,
    this.caption,
    this.parseMode = 'markdown',
  });

  factory ReqPhoto.fromJson(String str) => ReqPhoto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReqPhoto.fromMap(Map<String, dynamic> json) => ReqPhoto(
        chatId: json["chat_id"] == null ? null : json["chat_id"],
        photo: json["photo"] == null ? null : json["photo"],
        caption: json["caption"] == null ? null : json["caption"],
        parseMode: json["parse_mode"] == null ? null : json["parse_mode"],
      );

  Map<String, dynamic> toMap() => {
        "chat_id": chatId == null ? null : chatId,
        "photo": photo == null ? null : photo,
        "caption": caption == null ? null : caption,
        "parse_mode": parseMode == null ? null : parseMode,
      };
}
