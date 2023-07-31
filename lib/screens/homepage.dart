import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "WhatsApp",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.camera_alt,
                color: Colors.white,
              )),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            color: Colors.white,
          ),
          PopupMenuButton(
            color: Colors.white,
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(value: 1, child: Text("New Group")),
                PopupMenuItem(value: 2, child: Text("New Broadcast")),
                PopupMenuItem(value: 3, child: Text("linked Devices")),
                PopupMenuItem(value: 4, child: Text("Starred Messages")),
                PopupMenuItem(value: 5, child: Text("Payments")),
                PopupMenuItem(value: 6, child: Text("Settings")),
              ];
            },
          )
        ],
      ),
    );
  }
}
