import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
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
  bool showSend = false;
  bool showEmoji = false;
  TextEditingController _textController = TextEditingController();

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
                return const [
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
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25)),
                        width: MediaQuery.of(context).size.width - 70,
                        child: TextField(
                          onChanged: (value) {
                            if (value.length > 0) {
                              setState(() {
                                showSend = true;
                              });
                            } else {
                              setState(() {
                                showSend = false;
                              });
                            }
                          },
                          onTap: () {
                            setState(() {
                              showEmoji = true;
                            });
                          },
                          controller: _textController,
                          cursorColor: Colors.teal,
                          style: TextStyle(fontSize: 20),
                          decoration: InputDecoration(
                              prefixIcon: IconButton(
                                  onPressed: () {
                                    if (showEmoji) {
                                      FocusScope.of(context).unfocus();
                                    }
                                    setState(() {
                                      showEmoji = !showEmoji;
                                    });
                                  },
                                  icon: (showEmoji)
                                      ? Icon(Icons.emoji_emotions_outlined)
                                      : Icon(Icons.keyboard)),
                              border: InputBorder.none,
                              hintText: "Enter message",
                              hintStyle: TextStyle(fontSize: 15),
                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                      onPressed: () => showModalBottomSheet(
                                            context: context,
                                            builder: (context) => bottomMenu(),
                                          ),
                                      icon: Icon(Icons.attach_file)),
                                  Icon(Icons.currency_rupee_rounded),
                                  UtilityWidget().widthSpace(5),
                                  Icon(Icons.camera_alt),
                                  UtilityWidget().widthSpace(15),
                                ],
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        child: FloatingActionButton(
                          backgroundColor: Colors.teal,
                          onPressed: () {
                            setState(() {
                              messageList.add(SingleChat(
                                  isSent: true,
                                  isRead: false,
                                  message: _textController.text,
                                  sentAt: "10:10am"));
                            });
                            _textController.clear();
                          },
                          child:
                              (showSend) ? Icon(Icons.send) : Icon(Icons.mic),
                        ),
                      )
                    ],
                  ),
                  Offstage(
                    offstage: showEmoji,
                    child: SizedBox(
                      height: 300,
                      child: EmojiPicker(
                        textEditingController: _textController,
                        onEmojiSelected: (category, emoji) {
                          setState(() {
                            showSend = true;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Container bottomMenu() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      width: 350,
      height: 350,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              menuIcon(
                  text: "Document",
                  icon: Icon(Icons.insert_drive_file, color: Colors.white),
                  color: Colors.indigo),
              menuIcon(
                  text: "Camera",
                  icon: Icon(Icons.camera_alt, color: Colors.white),
                  color: Colors.pink),
              menuIcon(
                  text: "Gallery",
                  icon: Icon(Icons.insert_photo, color: Colors.white),
                  color: Colors.purple),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              menuIcon(
                  text: "Audio",
                  icon: Icon(Icons.headset, color: Colors.white),
                  color: Colors.orange),
              menuIcon(
                  text: "Location",
                  icon: Icon(Icons.location_pin, color: Colors.white),
                  color: Colors.green),
              menuIcon(
                  text: "Payments",
                  icon: Icon(Icons.currency_rupee_rounded, color: Colors.white),
                  color: Colors.teal),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              menuIcon(
                  text: "Contact",
                  icon: Icon(Icons.contact_phone, color: Colors.white),
                  color: Colors.blue),
              menuIcon(
                  text: "Poll",
                  icon: Icon(Icons.poll, color: Colors.white),
                  color: Colors.teal),
              UtilityWidget().widthSpace(60)
            ],
          )
        ],
      ),
    );
  }

  Column menuIcon(
      {required String text, required Icon icon, required Color color}) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: color,
          child: icon,
        ),
        UtilityWidget().heightSpace(10),
        Text(
          text,
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}
