import 'package:apl_weather_vlad/screens/auth.dart';
import 'package:apl_weather_vlad/screens/landing.dart';
import 'package:apl_weather_vlad/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MaxFitApp());
}

class MaxFitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Max Fitness",
      theme: ThemeData(
        primaryColor: Color.fromRGBO(50, 65, 85, 1),
        textTheme: TextTheme(
            title: TextStyle(
          color: Colors.white,
        )),
      ),
      home: AuthorizationPage(),
      // LandingPage(),
    );
  }
}
