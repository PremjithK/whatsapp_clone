import 'package:flutter/material.dart';
import '../models/chat_model.dart';

class ChatTile extends StatelessWidget {
  ChatTile({Key? key, required this.chatData}) : super(key: key);

  Chat chatData;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(chatData.name),
      leading: CircleAvatar(
        backgroundImage: (chatData.avatar != "")
            ? NetworkImage((chatData.isGroup) ? chatData.avatar : "person.png")
            : const NetworkImage(
                "https://cdn-icons-png.flaticon.com/512/6596/6596121.png"),
      ),
      subtitle: Text(chatData.message),
      trailing: Text(chatData.updatedAt),
    );
  }
}
