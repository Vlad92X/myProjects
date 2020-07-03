import 'package:apl_weather_vlad/domain/user.dart';
import 'package:apl_weather_vlad/screens/auth.dart';
import 'package:apl_weather_vlad/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:apl_weather_vlad/screens/splash.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    final bool isLoggedIn = user != null;

    return isLoggedIn ? HomePage() : AuthorizationPage();
  }
}
