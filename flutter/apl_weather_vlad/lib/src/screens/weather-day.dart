import 'package:apl_weather_vlad/src/model/weather.dart';
import 'package:apl_weather_vlad/src/screens/weather-fullday.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WeatherByTheDays extends StatefulWidget {
  List<Weather> listWeather = [];
  WeatherByTheDays({Key key, this.listWeather}) : super(key: key);

  @override
  _WeatherByTheDaysState createState() => _WeatherByTheDaysState();
}

class _WeatherByTheDaysState extends State<WeatherByTheDays> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: _buildList(context, widget.listWeather),
      ),
    );
  }

  List<Widget> _buildList(BuildContext context, List<Weather> weather) {
    return weather
        .map((Weather w) => ListTile(
              title: Text(w.mainWeather),
              leading: Text(
                w.printDay,
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              subtitle: Text('temp: ${w.temp.toString()}f'),
              trailing: Column(children: <Widget>[
                Icon(
                  w.getIconData(),
                  color: Colors.black,
                  size: 18,
                ),
                Text(w.description),
              ]),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => WeatherFullScreen()));
              },
            ))
        .toList();
  }
}
