// ignore_for_file: prefer_const_constructors

import 'package:chatapp/CustomUi/custom_card.dart';
import 'package:chatapp/Model/chat_model.dart';
import 'package:chatapp/Screens/select_contact.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chart = [
    ChatModel(
        name: "Hussain Shah",
        icon: "icon",
        isGroup: false,
        status: 'u',
        time: "4:0",
        currentMessage: "hi"),
    ChatModel(
        name: "Ali Hassan",
        icon: "icon",
        isGroup: false,
        status: 'u',
        time: "9:45",
        currentMessage: "???"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (builder) => SelectContact()));
          },
          child: Icon(
            Icons.chat,
            color: Colors.white,
          ),
        ),
        body: ListView.builder(
            itemCount: chart.length,
            itemBuilder: (context, index) {
              return CustomCard(
                chatModel: chart[index],
              );
            }));
  }
}
