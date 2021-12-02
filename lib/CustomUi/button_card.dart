// ignore_for_file: prefer_const_constructors

import 'package:chatapp/Model/chat_model.dart';
import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({
    Key? key,
    required this.name,
    required this.iconData,
  }) : super(key: key);
  final String name;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        child: Icon(iconData),
      ),
      title: Text(
        name,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
