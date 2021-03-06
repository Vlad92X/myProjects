import 'package:apl_weather_vlad/src/screens/weather-clock.dart';
import 'package:apl_weather_vlad/src/screens/weather-day.dart';
import 'package:apl_weather_vlad/src/utils/constants.dart';
import 'package:apl_weather_vlad/src/model/weather.dart';

import 'package:apl_weather_vlad/src/services/dataWeather.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int sectionIndex = 0;
  var navigateHeight = 0.0;
  var filterText = '';
  var url = URLcomponents(city: 'Kharkiv');

  // var listWeather = List<Weather>();
  List<Weather> listWeather = [];

  @override
  Widget build(BuildContext context) {
    setState(() {
      //listWeather = futureData;

      if (sectionIndex == 0) {
        sectionIndex = 1;
      } else {
        sectionIndex = 0;
      }
    });

    return Scaffold(
      backgroundColor: ColorTool().bgColorBackground,
      appBar: AppBar(
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.supervised_user_circle,
                color: Colors.white,
              ),
              label: SizedBox.shrink())
        ],
        title: Center(
          child: Text('Kharkiv',
              style: TextStyle(
                fontSize: 22,
              )),
        ),
        leading: RaisedButton(
          color: ColorTool().bgColorPrimary,
          child: Row(
            children: <Widget>[
              (sectionIndex == 0
                  ? Icon(
                      Icons.timer,
                      color: Colors.white,
                    )
                  : Icon(
                      Icons.calendar_today,
                      color: Colors.white,
                    )),
              Text(
                filterText,
                style: TextStyle(),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          onPressed: () {
            setState(() {});
          },
        ),
      ),
      body: sectionIndex == 0
          ? WeatherByTheDays(listWeather: listWeather)
          : WeatherByTheClock(),
      floatingActionButton: FloatingActionButton(
          backgroundColor: ColorTool().bgColorActive,
          child: Icon(Icons.refresh),
          onPressed: () => loadDataWeather(url)),
    );
  }
}
