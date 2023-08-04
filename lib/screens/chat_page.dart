import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/chat_model.dart';
import 'package:whatsapp_clone/screens/chat_tile.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  List<Chat> chatList = [
    Chat(
        avatar: "",
        name: "Amal",
        isGroup: false,
        updatedAt: "10:00am",
        message: "How are you"),
    Chat(
        avatar: "",
        name: "George",
        isGroup: false,
        updatedAt: "11:00am",
        message: "I am fine"),
    Chat(
        avatar: "",
        name: "Steve",
        isGroup: false,
        updatedAt: "12:00am",
        message: "I am fine")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amberAccent,
      body: ListView.builder(
        itemCount: chatList.length,
        itemBuilder: (context, index) {
          return ChatTile(chat_data: chatList[index]);
        },
      ),
    );
  }
}
