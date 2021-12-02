// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class OwnMessageCard extends StatelessWidget {
  const OwnMessageCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(),
        child: Card(
          color: Colors.green[100],
          child: Stack(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text("Hey"),
              Row(
                children: [Text("20:56"), Icon(Icons.done_all)],
              )
            ],
          ),
        ),
      ),
    );
  }
}
