import 'package:apl_weather_vlad/core/constants.dart';
import 'package:apl_weather_vlad/domain/user.dart';
import 'package:apl_weather_vlad/screens/landing.dart';
import 'package:apl_weather_vlad/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().currentUser,
      child: MaterialApp(
        title: "Weather",
        theme: ThemeData(
          primaryColor: ColorTool().bgColorPrimary,
          textTheme: TextTheme(
              title: TextStyle(
            color: Colors.white,
          )),
        ),
        home: LandingPage(),
      ),
    );
  }
}
