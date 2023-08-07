import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/single_chat_model.dart';

class ChatBubble extends StatelessWidget {
  ChatBubble({super.key, required this.messageList});
  SingleChat messageList;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          (messageList.isSent) ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 150),
        child: Card(
          color: (messageList.isSent) ? Colors.teal[700] : Colors.white,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 45, bottom: 20),
                child: Text(messageList.message,
                    style: TextStyle(
                        color: (messageList.isSent)
                            ? Colors.white
                            : Colors.black)),
              ),
              Positioned(
                  top: 14,
                  right: 3,
                  child: Row(
                    children: [
                      Text(
                        messageList.sentAt,
                        style: TextStyle(
                            fontSize: 10,
                            color: (messageList.isSent)
                                ? Colors.white
                                : Colors.black),
                      ),
                      (messageList.isSent)
                          ? Icon(
                              Icons.done_all,
                              size: 15,
                              color: (messageList.isRead)
                                  ? Colors.blue[300]
                                  : Colors.grey,
                            )
                          : Container()
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
