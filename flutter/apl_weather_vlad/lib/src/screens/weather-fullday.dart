import 'package:apl_weather_vlad/src/utils/constants.dart';
// import 'package:apl_weather_vlad/src/model/weather.dart';
import 'package:flutter/material.dart';

class WeatherFullScreen extends StatefulWidget {
  @override
  _WeatherFullScreenState createState() => _WeatherFullScreenState();
}

class _WeatherFullScreenState extends State<WeatherFullScreen>
    with TickerProviderStateMixin {
  // String _cityName = 'bengaluru';
  AnimationController _fadeController;
  Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    _fadeAnimation =
        CurvedAnimation(parent: _fadeController, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorTool().bgColorPrimary,
          elevation: 0,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                " DateFormat('EEEE, d MMMM yyyy')",
                style: TextStyle(color: ColorTool().bgColorRest, fontSize: 14),
              )
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: Material(
          child: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(color: ColorTool().bgColorPrimary),
            child: FadeTransition(
                opacity: _fadeAnimation, child: Text("text") // BlocBuilder()

                ),
          ),
        ));
  }
}
