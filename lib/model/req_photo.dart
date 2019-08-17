import 'dart:convert';

class ReqPhoto {
  String chatId;
  String photo;
  String caption;
  String parseMode;
  String reply_to_message_id;

  ReqPhoto({
    this.chatId,
    this.photo,
    this.caption,
    this.parseMode = 'markdown',
    this.reply_to_message_id,
  });

  factory ReqPhoto.fromJson(String str) => ReqPhoto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReqPhoto.fromMap(Map<String, dynamic> json) => ReqPhoto(
        chatId: json["chat_id"] == null ? null : json["chat_id"],
        photo: json["photo"] == null ? null : json["photo"],
        caption: json["caption"] == null ? null : json["caption"],
        parseMode: json["parse_mode"] == null ? null : json["parse_mode"],
        reply_to_message_id: json["reply_to_message_id"] == null
            ? null
            : json["reply_to_message_id"],
      );

  Map<String, dynamic> toMap() => {
        "chat_id": chatId == null ? null : chatId,
        "photo": photo == null ? null : photo,
        "caption": caption == null ? null : caption,
        "parse_mode": parseMode == null ? null : parseMode,
        "reply_to_message_id":
            reply_to_message_id == null ? null : reply_to_message_id,
      };
}
