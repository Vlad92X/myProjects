import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SplashState();
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Image.asset('assets/images/board-image.jpg');
  // }

  bool get isLoadingSplash => _SplashState().isSplash;
}

class _SplashState extends State<Splash> {
  bool _loading = true;
  int _timerEnd;

  bool get isSplash => _loading;

  @override
  void initState() {
    _loading = true;
    _timerEnd = 3;
    super.initState();
    _updateProgress();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          leading: CircleAvatar(
            child: Text(
              _timerEnd.toString(),
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          title: Text("На провах рекламы!"),
        ),
        //----------------------- часть основная  Body
        body: Center(
          child: Image.asset('assets/images/board-image.jpg'),
        ),
      ),
    );
  }

  void _updateProgress() {
    const oneSec = const Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer t) {
      setState(() {
        _timerEnd -= 1;

        if (_timerEnd.toString() == '0') {
          _loading = false;
          t.cancel();
          _timerEnd = 0;
          return;
        }
      });
    });
  }
}
