import 'dart:convert';

class ResPhoto {
  int errorCode;
  String description;
  bool ok;
  Result result;

  ResPhoto({
    this.errorCode,
    this.description,
    this.ok,
    this.result,
  });

  factory ResPhoto.fromJson(String str) => ResPhoto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResPhoto.fromMap(Map<String, dynamic> json) => ResPhoto(
        errorCode: json["error_code"] == null ? null : json["error_code"],
        description: json["description"] == null ? null : json["description"],
        ok: json["ok"] == null ? null : json["ok"],
        result: json["result"] == null ? null : Result.fromMap(json["result"]),
      );

  Map<String, dynamic> toMap() => {
        "error_code": errorCode == null ? null : errorCode,
        "description": description == null ? null : description,
        "ok": ok == null ? null : ok,
        "result": result == null ? null : result.toMap(),
      };
}

class Result {
  int messageId;
  Chat chat;
  int date;
  List<Photo> photo;
  String caption;

  Result({
    this.messageId,
    this.chat,
    this.date,
    this.photo,
    this.caption,
  });

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        messageId: json["message_id"] == null ? null : json["message_id"],
        chat: json["chat"] == null ? null : Chat.fromMap(json["chat"]),
        date: json["date"] == null ? null : json["date"],
        photo: json["photo"] == null
            ? null
            : List<Photo>.from(json["photo"].map((x) => Photo.fromMap(x))),
        caption: json["caption"] == null ? null : json["caption"],
      );

  Map<String, dynamic> toMap() => {
        "message_id": messageId == null ? null : messageId,
        "chat": chat == null ? null : chat.toMap(),
        "date": date == null ? null : date,
        "photo": photo == null
            ? null
            : List<dynamic>.from(photo.map((x) => x.toMap())),
        "caption": caption == null ? null : caption,
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

class Photo {
  String fileId;
  int fileSize;
  int width;
  int height;

  Photo({
    this.fileId,
    this.fileSize,
    this.width,
    this.height,
  });

  factory Photo.fromJson(String str) => Photo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Photo.fromMap(Map<String, dynamic> json) => Photo(
        fileId: json["file_id"] == null ? null : json["file_id"],
        fileSize: json["file_size"] == null ? null : json["file_size"],
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
      );

  Map<String, dynamic> toMap() => {
        "file_id": fileId == null ? null : fileId,
        "file_size": fileSize == null ? null : fileSize,
        "width": width == null ? null : width,
        "height": height == null ? null : height,
      };
}
