import 'package:apl_weather_vlad/components/today-weather.dart';
import 'package:apl_weather_vlad/components/weather-list.dart';
import 'package:apl_weather_vlad/domain/weather.dart';
import 'package:apl_weather_vlad/screens/splash.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int sectionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          appBar: AppBar(
            title: Text('Weather'),
            leading: Icon(Icons.fitness_center),
          ),
          body: //WeathersList(),
              sectionIndex == 0 ? WeathersList() : TodayWeather(),
          bottomNavigationBar: CurvedNavigationBar(
            items: const <Widget>[
              Icon(Icons.fitness_center),
              Icon(Icons.search)
            ],
            index: 0,
            height: 50,
            color: Colors.white.withOpacity(0.5),
            buttonBackgroundColor: Colors.white,
            backgroundColor: Colors.white.withOpacity(0.5),
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 500),
            onTap: (int index) {
              setState(() => sectionIndex = index);
            },
          )),
    );
  }
}
