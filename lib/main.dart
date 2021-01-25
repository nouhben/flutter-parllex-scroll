import 'package:flutter/material.dart';
import 'package:parallex/shared/constants.dart';
import 'package:parallex/shared/size_config.dart';
import 'package:transparent_image/transparent_image.dart';

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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _offset = 0.0;
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Material(
      child: NotificationListener<ScrollNotification>(
        onNotification: _updateOffsetAccordingToScroll,
        child: Stack(
          children: [
            Positioned(
              top: -0.25 * _offset,
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: kHeroImage,
                height: SizeConfig.screenHeight,
                width: SizeConfig.screenWidth,
                fit: BoxFit.cover,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight),
                  Container(
                    height: SizeConfig.screenHeight,
                    width: SizeConfig.screenWidth,
                    color: Colors.deepOrange,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _updateOffsetAccordingToScroll(ScrollNotification notification) {
    setState(() => _offset = notification.metrics.pixels);
    return true;
  }
}
