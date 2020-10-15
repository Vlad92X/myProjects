import 'package:apl_weather_vlad/src/utils/constants.dart';
import 'package:apl_weather_vlad/src/domain/user.dart';
import 'package:apl_weather_vlad/src/screens/landing.dart';
import 'package:apl_weather_vlad/src/services/auth.dart';
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
        title: "User List",
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
