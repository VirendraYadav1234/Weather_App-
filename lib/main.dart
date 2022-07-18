import 'package:flutter/material.dart';
import 'Activity/Home.dart';
import 'Activity/loading.dart';
import 'Activity/location.dart';

void main() {
  runApp(MaterialApp(
    // home: Home(),   // here no need to give defaut page because we give belowe default routes
    routes: {
      "/": (context) => Loading(),
      "/home": (context) => Home(),
      "/loading": (context) => Loading(),
    },
  ));
}
