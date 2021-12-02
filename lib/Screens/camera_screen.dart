// ignore_for_file: prefer_const_constructors

import 'dart:ffi';
import 'dart:io';
import 'dart:math';

import 'package:chatapp/Screens/camera_view_page.dart';
import 'package:chatapp/Screens/video_view_page.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

List<CameraDescription>? cameras;

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController cameraController;
  late Future<void> cameravalue;
  bool isRecording = false;
  bool flash = false;
  bool isfrontcam = true;
  double transform = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cameraController = CameraController(cameras![0], ResolutionPreset.high);
    cameravalue = cameraController.initialize();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
              future: cameravalue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CameraPreview(cameraController);
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              flash = !flash;
                            });
                            flash
                                ? cameraController.setFlashMode(FlashMode.torch)
                                : cameraController.setFlashMode(FlashMode.off);
                          },
                          icon: Icon(
                            flash ? Icons.flash_on : Icons.flash_off,
                            color: Colors.white,
                            size: 28,
                          )),
                      GestureDetector(
                        onLongPress: () async {
                          // final path = join(
                          //     (await getTemporaryDirectory()).path,
                          //     "${DateTime.now()}.mp4");

                          final video =
                              await cameraController.startVideoRecording();

                          setState(() {
                            isRecording = true;
                          });
                        },
                        onLongPressUp: () async {
                          XFile videopath =
                              await cameraController.stopVideoRecording();
                          setState(() {
                            isRecording = false;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) =>
                                      VideoViewPage(path: videopath.path)));
                        },
                        onTap: () {},
                        child: Center(
                          child: IconButton(
                              onPressed: () {
                                if (!isRecording) {
                                  takePicture(context);
                                }
                              },
                              icon: isRecording
                                  ? Icon(
                                      Icons.radio_button_on,
                                      color: Colors.red,
                                      size: 40,
                                    )
                                  : Icon(
                                      Icons.panorama_fish_eye,
                                      color: Colors.white,
                                      size: 40,
                                    )),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              isfrontcam = !isfrontcam;
                              transform = transform + pi;
                            });
                            int campos = isfrontcam ? 0 : 1;
                            cameraController = CameraController(
                                cameras![campos], ResolutionPreset.high);
                            cameravalue = cameraController.initialize();
                          },
                          icon: Transform.rotate(
                            angle: transform,
                            child: Icon(
                              Icons.flip_camera_ios,
                              color: Colors.white,
                              size: 28,
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Hold for Video ,tap for photo",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void takePicture(BuildContext context) async {
    // final path =
    //     join((await getTemporaryDirectory()).path, "${DateTime.now()}.png");
    XFile picture = await cameraController.takePicture();
    // picture.saveTo(path);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (builder) => CameraViewPage(
                  path: picture.path,
                )));
  }
}
