import 'package:apl_weather_vlad/domain/weather.dart';
import 'package:flutter/material.dart';

class WeatherByTheClock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: _buildList(),
      ),
    );
  }

  List<Weather> weather = [
    Weather(
        dt: '1594209600',
        mainDataTemp: MainDataWeather(
            temp: 296.92,
            feelsLike: 296.12,
            tempMin: 294.58,
            tempMax: 296.92,
            pressure: 1006),
        id: '500',
        mainWeather: "Rain",
        description: "light rain",
        clouds: 69,
        wind: Wind(speed: 4.83, degree: 328),
        rain: 2.56,
        dtTxt: DateTime.parse("2020-07-08 12:00:00")),
    Weather(
        dt: '1594209600',
        mainDataTemp: MainDataWeather(
            temp: 296.92,
            feelsLike: 296.12,
            tempMin: 294.58,
            tempMax: 296.92,
            pressure: 1006),
        id: '500',
        mainWeather: "Rain",
        description: "light rain",
        clouds: 69,
        wind: Wind(speed: 4.83, degree: 328),
        rain: 2.56,
        dtTxt: DateTime.parse("2020-07-09 15:00:00")),
    Weather(
        dt: '1594209600',
        mainDataTemp: MainDataWeather(
            temp: 296.92,
            feelsLike: 296.12,
            tempMin: 294.58,
            tempMax: 296.92,
            pressure: 1006),
        id: '500',
        mainWeather: "Rain",
        description: "light rain",
        clouds: 69,
        wind: Wind(speed: 4.83, degree: 328),
        rain: 2.56,
        dtTxt: DateTime.parse("2020-07-10 17:00:00")),
  ];

  List<Widget> _buildList() {
    return weather
        .map((Weather w) => ListTile(
              title: Text(w.mainWeather),
              leading: Text(
                w.printTime,
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              subtitle: Text('temp: ${w.mainDataTemp.temp.toString()}f'),
              trailing: Text(w.description),
            ))
        .toList();
  }
}
