import 'package:flutter/material.dart';
import 'package:parallex/shared/constants.dart';
import 'package:parallex/shared/size_config.dart';
import 'package:transparent_image/transparent_image.dart';

import 'home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Parallex Scroll Demo '),
    );
  }
}
