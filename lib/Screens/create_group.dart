// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:chatapp/CustomUi/avatr_card.dart';
import 'package:chatapp/CustomUi/button_card.dart';
import 'package:chatapp/CustomUi/contact_card.dart';
import 'package:chatapp/Model/chat_model.dart';
import 'package:flutter/material.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({Key? key}) : super(key: key);

  @override
  _CreateGroupState createState() => _CreateGroupState();
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

List<ChatModel> groups = [];

class _CreateGroupState extends State<CreateGroup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "New Group",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              Text(
                "Add participants",
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
          ],
        ),
        body: Stack(
          children: [
            ListView.builder(
                itemCount: contact.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Container(
                      height: groups.length > 0 ? 90 : 10,
                    );
                  }
                  return InkWell(
                      onTap: () {
                        if (contact[index - 1].select == false) {
                          setState(() {
                            contact[index - 1].select = true;
                            groups.add(contact[index - 1]);
                          });
                        } else {
                          setState(() {
                            contact[index - 1].select = false;
                            groups.remove(contact[index - 1]);
                          });
                        }
                      },
                      child: ContactCard(contact: contact[index - 1]));
                }),
            groups.length > 0
                ? Column(
                    children: [
                      Card(
                        elevation: 5,
                        child: Container(
                          height: 75,
                          color: Colors.white,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: contact.length,
                              itemBuilder: (context, index) {
                                if (contact[index].select == true) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        contact[index].select = false;
                                        groups.remove(contact[index]);
                                      });
                                    },
                                    child: AvtarCard(
                                      contact: contact[index],
                                    ),
                                  );
                                } else {
                                  return Container();
                                }
                              }),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                    ],
                  )
                : Container(),
          ],
        ));
  }
}
