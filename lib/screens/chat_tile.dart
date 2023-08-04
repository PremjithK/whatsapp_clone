import 'package:flutter/material.dart';

import '../models/chat_model.dart';

class ChatTile extends StatelessWidget {
  ChatTile({Key? key, required this.chat_data}) : super(key: key);
  Chat chat_data;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(chat_data.name),
      leading: CircleAvatar(
          backgroundImage: (chat_data.avatar != "")
              ? NetworkImage((chat_data.isGroup) ? "group_url" : "person_url")
              : const NetworkImage("default_avatar_url")),
      subtitle: Text(chat_data.message),
      trailing: Text(chat_data.updatedAt),
    );
  }
}
