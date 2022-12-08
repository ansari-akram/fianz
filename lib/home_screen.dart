// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:fianz/adaptive_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:intl/intl.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';
// import 'package:flutter_webview_pro/webview_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final FlutterWebviewPlugin _web = FlutterWebviewPlugin();

  @override
  Widget build(BuildContext context) {
    _web.hide();
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton.large(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        // label: Text(
        //   "Qibla",
        //   style: TextStyle(
        //     color: Colors.black,
        //     fontSize: 25
        //   ),
        // ),
        child: Center(
          child: Image.asset(
            "assets/qibla_direction1.png",
            height: 70,
          ),
        ),
        // icon: Transform.rotate(
        //   angle: (((heading ?? 0) - 270) * (pi / 180) * -1),
        //   child: Icon(
        //     Icons.arrow_upward_rounded,
        //     size: 50,
        //     color: Colors.black,
        //   ),
        // ),
        // child: Column(
        //   children: [
        //     // SizedBox(height: 15),
        //     // Text("Qibla", style: TextStyle(color: Colors.black, fontSize: 25),),
        //     Image.asset(
        //       "assets/kaaba3.png",
        //       height: 45,
        //     ),
        //     Transform.rotate(
        //       angle: (((heading ?? 0) - 270) * (pi / 180) * -1),
        //       child: Icon(
        //         Icons.arrow_upward_rounded,
        //         size: 50,
        //         color: Colors.black,
        //       ),
        //     ),
        //   ],
        // ),
        // child: Stack(
        //   children: [
        //     // SizedBox(height: 15),
        //     // Text("Qibla", style: TextStyle(color: Colors.black, fontSize: 25),),
        //     Center(
        //       child: Image.asset(
        //         "assets/kaaba.png",
        //         // height: 45,
        //       ),
        //     ),
        //     Center(
        //       child: Transform.rotate(
        //         angle: (((heading ?? 0) - 270) * (pi / 180) * -1),
        //         child: Icon(
        //           Icons.arrow_upward_rounded,
        //           size: 65,
        //           color: Colors.white,
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        onPressed: () {
          Navigator.pushNamed(context, '/qibla-screen');
        },
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Text(
                  DateFormat("yyyy-MM-dd hh:mm:ss a").format(DateTime.now()),
                  style: TextStyle(
                    fontSize:
                        AdaptiveTextSize().getAdaptiveTextSize(context, 17),
                    color: Colors.black,
                  ),
                ),
                Expanded(
                  // height: MediaQuery.of(context).size.height - 115,
                  child: WebView(
                    //  bottomNavigationBar: FloatingActionButton.large(
                    //   child: Text('hello'),
                    //   onPressed: () {},
                    // ),
                    initialUrl: "https://fianz.com/",
                    // initialUrl: "https://fianz.com/",
                    // javascriptMode: JavascriptMode.unrestricted,
                    // zoomEnabled: false,
                    // geolocationEnabled: true,
                    // withJavascript: true,
                    javascriptMode: JavascriptMode.unrestricted,
                  ),
                ),
              ],
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            //   child: Align(
            //     alignment: Alignment.bottomLeft,
            //     child: Container(
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(10),
            //         color: Colors.white,
            //       ),
            //       child: Transform.rotate(
            //         angle: (((heading ?? 0) - 270) * (pi / 180) * -1),
            //         child: Icon(
            //           Icons.arrow_upward_rounded,
            //           size: 50,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
