// ignore_for_file: prefer_const_constructors, prefer_final_fields, use_build_context_synchronously, avoid_print, prefer_interpolation_to_compose_strings

import 'package:fianz/adaptive_text.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:location/location.dart';


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  // SnackBar _locationSB = SnackBar(
  //   content: Text('Device location enabled'),
  // );
  //
  // SnackBar _locationNSB = SnackBar(
  //   content: Text('Device location disabled'),
  // );

  _checkPermissions() async {
    Location location = Location();
    bool permission = await location.hasPermission() == PermissionStatus.granted;
    // print("PERMISSION " + permission.toString());
    if (!permission) {
      // ScaffoldMessenger.of(context).showSnackBar(_locationNSB);
      await location.requestPermission();
    }
    Timer(Duration(seconds: 3), () async {
      Navigator.pushReplacementNamed(context, "/home-screen");
    });
  }

  @override
  void initState() {
    _checkPermissions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/fianz_logo.png',
              height: AdaptiveTextSize().getAdaptiveTextSize(context, 250),
              width: AdaptiveTextSize().getAdaptiveTextSize(context, 250),
            ),
            CircularProgressIndicator(
              // color: secondaryColor,
              // backgroundColor: primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
