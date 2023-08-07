import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/chat_model.dart';
import 'package:whatsapp_clone/screens/chat_tile.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  List<Chat> chatList = [
    Chat(
        avatar: "",
        name: "Amal",
        isGroup: true,
        updatedAt: "10:00am",
        message: "How are you",
        status: "Online"),
    Chat(
        avatar:
            "https://static.vecteezy.com/system/resources/previews/002/002/403/original/man-with-beard-avatar-character-isolated-icon-free-vector.jpg",
        name: "George",
        isGroup: false,
        updatedAt: "11:00am",
        message: "I am fine",
        status: "Last seen 2 mins ago"),
    Chat(
        avatar: "",
        name: "Steve",
        isGroup: false,
        updatedAt: "12:00am",
        message: "I am fine",
        status: "Last seen 3 mins ago ")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amberAccent,
      body: ListView.builder(
        itemCount: chatList.length,
        itemBuilder: (context, index) {
          return ChatTile(chatData: chatList[index]);
        },
      ),
    );
  }
}
