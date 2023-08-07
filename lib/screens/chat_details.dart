import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/chat_model.dart';
import 'package:whatsapp_clone/models/single_chat_model.dart';
import 'package:whatsapp_clone/widgets/chat_bubble.dart';
import 'package:whatsapp_clone/widgets/utilities_widget.dart';

class ChatDetails extends StatefulWidget {
  ChatDetails({super.key, required this.chatData});
  Chat chatData;

  @override
  State<ChatDetails> createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  List<SingleChat> messageList = [
    SingleChat(
        isSent: true,
        isRead: false,
        message: "Hello, where are you?",
        sentAt: "10:00am"),
    SingleChat(
        isSent: false, isRead: false, message: "Kannur", sentAt: "10:05am"),
    SingleChat(
        isSent: true,
        isRead: true,
        message: "When did you get there?",
        sentAt: "10:10am"),
    SingleChat(
        isSent: false,
        isRead: false,
        message: "When did you get there?",
        sentAt: "10:10am"),
    SingleChat(
        isSent: false,
        isRead: false,
        message: "When did you get there?",
        sentAt: "10:10am"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.chatData.name,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(
                widget.chatData.status,
                style: TextStyle(color: Colors.white, fontSize: 10),
              )
            ],
          ),
          leadingWidth: 74,
          leading: Row(
            children: [
              SizedBox(
                width: 5,
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              CircleAvatar(
                backgroundImage: (widget.chatData.avatar == "")
                    ? NetworkImage((widget.chatData.isGroup)
                        ? "https://image.winudf.com/v2/image/Y29tLmFwcC53aGF0c2FwcC5kcC5wcm9maWxlLnBpYy5kb3dubG9hZC5zYXZlcl9pY29uXzBfYTRmYmNhODM/icon.png?w=&fakeurl=1"
                        : "https://cdn-icons-png.flaticon.com/512/6596/6596121.png")
                    : NetworkImage(widget.chatData.avatar),
              ),
            ],
          ),
          backgroundColor: Colors.teal,
          actions: [
            Icon(
              Icons.video_call,
              color: Colors.white,
            ),
            UtilityWidget().widthSpace(10),
            Icon(
              Icons.phone,
              color: Colors.white,
            ),
            PopupMenuButton(
              color: Colors.white,
              itemBuilder: (context) {
                return [
                  PopupMenuItem(child: Text("Group Info")),
                  PopupMenuItem(child: Text("Group Media")),
                  PopupMenuItem(child: Text("Group Search")),
                  PopupMenuItem(child: Text("Mute Notifications")),
                  PopupMenuItem(child: Text("Disappearing Messages")),
                  PopupMenuItem(child: Text("Wallpaper")),
                  PopupMenuItem(child: Text("More")),
                ];
              },
            )
          ],
        ),
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                "https://i.pinimg.com/736x/8c/98/99/8c98994518b575bfd8c949e91d20548b.jpg",
                fit: BoxFit.cover,
              ),
            ),
            ListView.builder(
              itemCount: messageList.length,
              itemBuilder: (context, index) {
                return ChatBubble(messageList: messageList[index]);
              },
            )
          ],
        ));
  }
}
