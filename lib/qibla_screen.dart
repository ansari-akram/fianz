// ignore_for_file: prefer_const_constructors, avoid_print

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';


class QiblaScreen extends StatefulWidget {
  const QiblaScreen({Key? key}) : super(key: key);

  @override
  State<QiblaScreen> createState() => _QiblaScreenState();
}

class _QiblaScreenState extends State<QiblaScreen> {

  double? heading = 0;

  @override
  void initState() {
    super.initState();
    FlutterCompass.events!.listen((event) {
      setState(() {
        heading = event.heading;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, "true");
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: BackButton(onPressed: () async {
            Navigator.pop(context, "true");
          }),
          title: Text('Qibla Direction'),
        ),
        body: Center(
          child: Transform.rotate(
            //Qibla direction 1 230
            //Qibla direction 3 270
            //Qibla direction 4 270
            angle: (((heading ?? 0) - 230) * (pi / 180) * -1),
            // transformHitTests: true,
            // child: Icon(
            //   Icons.arrow_upward_rounded,
            //   size: 50,
            //   color: Colors.black,
            // ),
            child: Image.asset('assets/qibla_direction1.png'),
          ),
        ),
      ),
    );
  }
}
