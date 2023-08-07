import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/chat_details.dart';
import '../models/chat_model.dart';

class ChatTile extends StatelessWidget {
  ChatTile({Key? key, required this.chatData}) : super(key: key);

  Chat chatData;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatDetails(chatData: chatData),
            ));
      },
      title: Text(chatData.name),
      leading: CircleAvatar(
        backgroundImage: (chatData.avatar == "")
            ? NetworkImage((chatData.isGroup)
                ? "https://image.winudf.com/v2/image/Y29tLmFwcC53aGF0c2FwcC5kcC5wcm9maWxlLnBpYy5kb3dubG9hZC5zYXZlcl9pY29uXzBfYTRmYmNhODM/icon.png?w=&fakeurl=1"
                : "https://cdn-icons-png.flaticon.com/512/6596/6596121.png")
            : NetworkImage(chatData.avatar),
      ),
      subtitle: Text(chatData.message),
      trailing: Text(chatData.updatedAt),
    );
  }
}
