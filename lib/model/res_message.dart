import 'dart:convert';

class ResMessage {
  bool ok;
  int errorCode;
  String description;
  Result result;

  ResMessage({
    this.ok,
    this.errorCode,
    this.description,
    this.result,
  });

  factory ResMessage.fromJson(String str) =>
      ResMessage.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResMessage.fromMap(Map<String, dynamic> json) => ResMessage(
        ok: json["ok"] == null ? null : json["ok"],
        errorCode: json["error_code"] == null ? null : json["error_code"],
        description: json["description"] == null ? null : json["description"],
        result: json["result"] == null ? null : Result.fromMap(json["result"]),
      );

  Map<String, dynamic> toMap() => {
        "ok": ok == null ? null : ok,
        "error_code": errorCode == null ? null : errorCode,
        "description": description == null ? null : description,
        "result": result == null ? null : result.toMap(),
      };
}

class Result {
  int messageId;
  Chat chat;
  int date;
  String text;

  Result({
    this.messageId,
    this.chat,
    this.date,
    this.text,
  });

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        messageId: json["message_id"] == null ? null : json["message_id"],
        chat: json["chat"] == null ? null : Chat.fromMap(json["chat"]),
        date: json["date"] == null ? null : json["date"],
        text: json["text"] == null ? null : json["text"],
      );

  Map<String, dynamic> toMap() => {
        "message_id": messageId == null ? null : messageId,
        "chat": chat == null ? null : chat.toMap(),
        "date": date == null ? null : date,
        "text": text == null ? null : text,
      };
}

class Chat {
  int id;
  String title;
  String username;
  String type;

  Chat({
    this.id,
    this.title,
    this.username,
    this.type,
  });

  factory Chat.fromJson(String str) => Chat.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Chat.fromMap(Map<String, dynamic> json) => Chat(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        username: json["username"] == null ? null : json["username"],
        type: json["type"] == null ? null : json["type"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "username": username == null ? null : username,
        "type": type == null ? null : type,
      };
}
