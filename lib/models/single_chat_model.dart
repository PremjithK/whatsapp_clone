// To parse this JSON data, do
//
//     final singleChat = singleChatFromJson(jsonString);

import 'dart:convert';

SingleChat singleChatFromJson(String str) => SingleChat.fromJson(json.decode(str));

String singleChatToJson(SingleChat data) => json.encode(data.toJson());

class SingleChat {
    bool isSent;
    bool isRead;
    String message;
    String sentAt;

    SingleChat({
        required this.isSent,
        required this.isRead,
        required this.message,
        required this.sentAt,
    });

    factory SingleChat.fromJson(Map<String, dynamic> json) => SingleChat(
        isSent: json["isSent"],
        isRead: json["isRead"],
        message: json["message"],
        sentAt: json["sentAt"],
    );

    Map<String, dynamic> toJson() => {
        "isSent": isSent,
        "isRead": isRead,
        "message": message,
        "sentAt": sentAt,
    };
}
