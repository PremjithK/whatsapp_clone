import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/single_chat_model.dart';

class ChatBubble extends StatelessWidget {
  ChatBubble({super.key, required this.messageList});
  SingleChat messageList;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 150),
        child: Card(
          color: Colors.white,
        ),
      ),
    );
  }
}
