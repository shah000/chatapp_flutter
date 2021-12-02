// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:chatapp/Screens/testcamera.dart';
import 'package:chatapp/pages/camera_page.dart';
import 'package:chatapp/pages/chat_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Whatapp Clone'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search_sharp,
                color: Colors.white,
              )),
          PopupMenuButton<String>(onSelected: (val) {
            print(val);
          }, itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: Text("New Group"),
                value: "New Group",
              ),
              PopupMenuItem(
                child: Text("New Brodcast"),
                value: "New Brodcast",
              ),
              PopupMenuItem(
                child: Text("Whatapps Web"),
                value: "Whatapps Web",
              ),
              PopupMenuItem(
                child: Text("Starred messages"),
                value: "Starred messages",
              ),
              PopupMenuItem(
                child: Text("Settings"),
                value: "Settings",
              ),
            ];
          })
        ],
        bottom: TabBar(controller: tabController, tabs: [
          Tab(
            icon: Icon(Icons.camera_alt),
          ),
          Tab(
            text: 'CHATS',
          ),
          Tab(
            text: 'STATUS',
          ),
          Tab(
            text: 'CALLS',
          )
        ]),
      ),
      body: TabBarView(controller: tabController, children: [
        CameraPage(),
        ChatPage(),
        CameraExampleHome(),
        Text("data")
      ]),
    );
  }
}
