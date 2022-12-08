// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, avoid_print, prefer_final_fields, use_build_context_synchronously

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fianz/adaptive_text.dart';
import 'package:intl/intl.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:location/location.dart';


class HomeScreenNew extends StatefulWidget {
  const HomeScreenNew({Key? key}) : super(key: key);

  @override
  State<HomeScreenNew> createState() => _HomeScreenNewState();
}

class _HomeScreenNewState extends State<HomeScreenNew> {

  SnackBar _locationSB = SnackBar(
    content: Text('Device location enabled'),
  );

  SnackBar _locationNSB = SnackBar(
    content: Text('Device location disabled'),
  );

  _checkPermissions() async {
    Location location = Location();
    bool permission = await location.hasPermission() == PermissionStatus.granted;
    print("PERMISSION $permission");
    if (!permission) {
      ScaffoldMessenger.of(context).showSnackBar(_locationNSB);
      // await location.requestPermission();
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(_locationSB);
    }
  }

  final FlutterWebviewPlugin _web = FlutterWebviewPlugin();
  late Timer _timer;
  // String formattedDateTime = DateFormat('yyyy-MM-dd\nhh:mm:ss a').format(DateTime.now());  //large
  String formattedDateTime = DateFormat('yyyy-MM-dd | hh:mm:ss a').format(DateTime.now());
  // WebviewScaffold webviewScaffold = WebviewScaffold(url: "https://fianz.com/",)

  @override
  void initState() {
    _checkPermissions();
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) => _update());
    super.initState();
  }

  void _update() {
    setState(() {
      // formattedDateTime = DateFormat('yyyy-MM-dd\nhh:mm:ss a').format(DateTime.now());  //large
      formattedDateTime = DateFormat('yyyy-MM-dd | hh:mm:ss a').format(DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    // _web.show();
    print("SCREEN1");
    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      // floatingActionButton: FloatingActionButton.large(
      //   onPressed: () {
      //     Navigator.pushNamed(context, '/qibla-screen');
      //   },
      //   backgroundColor: Colors.white,
      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      //   child: Center(
      //     child: Image.asset(
      //       "assets/qibla_direction1.png",
      //       height: 70,
      //     ),
      //   ),
      // ),
      body: Stack(
        children: [
          Container(
            // height: MediaQuery.of(context).size.height - 120,  //LARGE
            height: MediaQuery.of(context).size.height - 85,
            child: WebviewScaffold(
              // mediaPlaybackRequiresUserGesture: true,
              url: "https://fianz.com/",
              withJavascript: true,
              // persistentFooterButtons: [
              //   TextButton(onPressed: () {}, child: Text("hello")),
              //   TextButton(onPressed: () {}, child: Text("hello")),
              //   TextButton(onPressed: () {}, child: Text("hello"))
              // ],
              geolocationEnabled: true,
              supportMultipleWindows: true,
              clearCache: true,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(
                    onPressed: () async {
                      _web.hide();
                      var res = await Navigator.pushNamed<dynamic>(context, "/qibla-screen");
                      if (res == "true") {
                        _web.show();
                      }
                    },
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Image.asset(
                        "assets/qibla_direction1.png",
                        height: 45,
                      ),
                    ),
                  ),
                  Text(
                    formattedDateTime,
                    style: TextStyle(
                      fontSize:
                      // AdaptiveTextSize().getAdaptiveTextSize(context, 30),   //large
                      AdaptiveTextSize().getAdaptiveTextSize(context, 22),
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
