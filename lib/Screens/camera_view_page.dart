// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';

class CameraViewPage extends StatelessWidget {
  const CameraViewPage({Key? key, required this.path}) : super(key: key);
  final String path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.crop_rotate,
                color: Colors.white,
                size: 28,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.emoji_emotions_outlined,
                color: Colors.white,
                size: 28,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.title,
                color: Colors.white,
                size: 28,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.edit,
                color: Colors.white,
                size: 28,
              )),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 150,
              child: Image.file(
                File(path),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                color: Colors.black38,
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  maxLines: 5,
                  minLines: 1,
                  style: TextStyle(color: Colors.white, fontSize: 17),
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.add_photo_alternate,
                        size: 28,
                        color: Colors.white,
                      ),
                      suffixIcon: CircleAvatar(
                        child: Icon(
                          Icons.check,
                          size: 28,
                          color: Colors.white,
                        ),
                      ),
                      border: InputBorder.none,
                      hintText: 'Add Caption...',
                      hintStyle: TextStyle(color: Colors.white, fontSize: 17)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
