// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:chatapp/Model/chat_model.dart';
import 'package:flutter/material.dart';

class AvtarCard extends StatelessWidget {
  const AvtarCard({Key? key, required this.contact}) : super(key: key);
  final ChatModel contact;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(children: [
            CircleAvatar(
              radius: 25,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 11,
                child: Icon(
                  Icons.clear,
                  color: Colors.white,
                  size: 13,
                ),
              ),
            )
          ]),
          SizedBox(
            height: 2,
          ),
          Text(
            contact.name,
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
