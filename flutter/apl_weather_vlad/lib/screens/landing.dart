import 'package:apl_weather_vlad/screens/home.dart';
import 'package:apl_weather_vlad/screens/splash.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isLoggedIn = true;

    return isLoggedIn ? Splash() : HomePage();
  }
}
