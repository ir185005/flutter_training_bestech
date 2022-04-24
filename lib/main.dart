import 'package:flutter/material.dart';
import 'package:flutter_training_bestech/home_page.dart';
import 'package:flutter_training_bestech/video_info.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: VideoInfo(),
    );
  }
}
