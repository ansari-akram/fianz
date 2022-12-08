// ignore_for_file: prefer_const_constructors

import 'package:fianz/home_screen.dart';
import 'package:fianz/home_screen_new.dart';
import 'package:fianz/loading_screen.dart';
import 'package:fianz/qibla_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white, //or set color with: Color(0xFF0000FF)
    ));

    return MaterialApp(
      title: 'Fianz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/loading-screen',
      routes: {
        '/loading-screen': (context) => LoadingScreen(),
        '/home-screen': (context) => HomeScreenNew(),
        '/qibla-screen': (context) => QiblaScreen(),
      },
    );
  }
}