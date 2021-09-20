import 'package:flutter/material.dart';
import 'package:quotes/pages/choose_location.dart';
import 'package:quotes/pages/home.dart';
import 'package:quotes/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    // home: Home(),
    initialRoute: "/",
    routes: {
      "/": (context) => Loading(),
      "/home": (context) => Home(),
      "/location": (context) => ChooseLocation()
    },
  ));
}
