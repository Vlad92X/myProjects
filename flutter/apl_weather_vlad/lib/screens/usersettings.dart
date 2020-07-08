import 'package:apl_weather_vlad/screens/auth.dart';
import 'package:flutter/material.dart';

class UserSettings extends StatelessWidget {
  const UserSettings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AuthorizationPage(),
    );
  }

  settings() {
    print('on press User Setting');
  }
}
