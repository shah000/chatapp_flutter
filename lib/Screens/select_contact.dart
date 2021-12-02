// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:chatapp/CustomUi/button_card.dart';
import 'package:chatapp/CustomUi/contact_card.dart';
import 'package:chatapp/Model/chat_model.dart';
import 'package:chatapp/Screens/create_group.dart';
import 'package:flutter/material.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({Key? key}) : super(key: key);

  @override
  _SelectContactState createState() => _SelectContactState();
}

List<ChatModel> contact = [
  ChatModel(
      name: "Hussain Shah",
      icon: "icon",
      isGroup: false,
      status: 'j',
      time: "4:0",
      currentMessage: "hi"),
  ChatModel(
      name: "Ali Hassan",
      icon: "icon",
      isGroup: false,
      status: 'u',
      time: "9:45",
      currentMessage: "???"),
  ChatModel(
      name: "Ali Hassan",
      icon: "icon",
      isGroup: false,
      status: 'u',
      time: "9:45",
      currentMessage: "???"),
  ChatModel(
      name: "Hussain Shah",
      icon: "icon",
      isGroup: false,
      status: 'j',
      time: "4:0",
      currentMessage: "hi"),
];

class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select Contact",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              Text(
                "256 contacts",
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  size: 26,
                )),
            PopupMenuButton<String>(onSelected: (val) {
              print(val);
            }, itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text("Invite a friend"),
                  value: "Invite a friend ",
                ),
                PopupMenuItem(
                  child: Text("Contact"),
                  value: "Contact",
                ),
                PopupMenuItem(
                  child: Text("Refresh"),
                  value: "Refresh",
                ),
                PopupMenuItem(
                  child: Text("Help"),
                  value: "help",
                ),
              ];
            })
          ],
        ),
        body: ListView.builder(
            itemCount: contact.length + 2,
            itemBuilder: (context, index) {
              if (index == 0) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => CreateGroup()));
                  },
                  child: ButtonCard(
                    iconData: Icons.group,
                    name: "New group",
                  ),
                );
              } else if (index == 1) {
                return ButtonCard(
                  iconData: Icons.person_add,
                  name: "New Contact",
                );
              }
              return ContactCard(contact: contact[index - 2]);
            }));
  }
}
