// import 'package:apl_weather_vlad/src/api/weather_api_client.dart';
import 'package:apl_weather_vlad/src/model/weather.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WeatherByTheClock extends StatefulWidget {
  @override
  _WeatherByTheClockState createState() => _WeatherByTheClockState();
}

class _WeatherByTheClockState extends State<WeatherByTheClock> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: _buildList(),
      ),
    );
  }

  // WeatherApiClient client;

  List<Weather> weather2 = [
    Weather(
        dtKeyId: '1594209600',
        temp: 296.92,
        tempfeelsLike: 296.12,
        tempMin: 294.58,
        tempMax: 296.92,
        pressure: 1006,
        id: '500',
        mainWeather: "Rain",
        description: "light rain",
        iconCode: "02n",
        clouds: 69,
        speedWind: 4.83,
        degreeWind: 328,
        rain: 2.56,
        dtTxt: DateTime.parse("2020-07-15 12:00:00")),
    Weather(
        dtKeyId: '1594209600',
        temp: 296.92,
        tempfeelsLike: 296.12,
        tempMin: 294.58,
        tempMax: 296.92,
        pressure: 1006,
        id: '500',
        mainWeather: "Rain",
        description: "light rain",
        iconCode: "02n",
        clouds: 69,
        speedWind: 4.83,
        degreeWind: 328,
        rain: 2.56,
        dtTxt: DateTime.parse("2020-07-15 15:00:00")),
    Weather(
        dtKeyId: '1594209600',
        temp: 296.92,
        tempfeelsLike: 296.12,
        tempMin: 294.58,
        tempMax: 296.92,
        pressure: 1006,
        id: '500',
        mainWeather: "Rain",
        description: "light rain",
        iconCode: "02n",
        clouds: 69,
        speedWind: 4.83,
        degreeWind: 328,
        rain: 2.56,
        dtTxt: DateTime.parse("2020-07-16 12:00:00")),
    Weather(
        dtKeyId: '1594209600',
        temp: 296.92,
        tempfeelsLike: 296.12,
        tempMin: 294.58,
        tempMax: 296.92,
        pressure: 1006,
        id: '500',
        mainWeather: "Rain",
        description: "light rain",
        iconCode: "02n",
        clouds: 69,
        speedWind: 4.83,
        degreeWind: 328,
        rain: 2.56,
        dtTxt: DateTime.parse("2020-07-09 15:00:00")),
    Weather(
        dtKeyId: '1594209600',
        temp: 296.92,
        tempfeelsLike: 296.12,
        tempMin: 294.58,
        tempMax: 296.92,
        pressure: 1006,
        id: '500',
        mainWeather: "Rain",
        description: "light rain",
        iconCode: "02n",
        clouds: 69,
        speedWind: 4.83,
        degreeWind: 328,
        rain: 2.56,
        dtTxt: DateTime.parse("2020-07-10 12:00:00")),
    Weather(
        dtKeyId: '1594209600',
        temp: 296.92,
        tempfeelsLike: 296.12,
        tempMin: 294.58,
        tempMax: 296.92,
        pressure: 1006,
        id: '500',
        mainWeather: "Rain",
        description: "light rain",
        iconCode: "02n",
        clouds: 69,
        speedWind: 4.83,
        degreeWind: 328,
        rain: 2.56,
        dtTxt: DateTime.parse("2020-07-14 15:00:00")),
    Weather(
        dtKeyId: '1594209600',
        temp: 296.92,
        tempfeelsLike: 296.12,
        tempMin: 294.58,
        tempMax: 296.92,
        pressure: 1006,
        id: '500',
        mainWeather: "Rain",
        description: "light rain",
        iconCode: "02n",
        clouds: 69,
        speedWind: 4.83,
        degreeWind: 328,
        rain: 2.56,
        dtTxt: DateTime.parse("2020-07-14 17:00:00")),
  ];

  List<Weather> weatherForClock;

  List<Widget> _buildList() {
    weatherForClock = weather2
        .where((element) => element.dtTxt.day == DateTime.now().day)
        .toList();

    return weatherForClock
        .map(
          (Weather w) => ListTile(
            title: Text(w.mainWeather),
            leading: Text(
              w.printTime,
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            subtitle: Text('temp: ${w.temp.toString()}f'),
            trailing: Column(children: <Widget>[
              Icon(
                Icons.my_location,
                color: Colors.black,
                size: 18,
              ),
              Text(w.description),
            ]),
          ),
        )
        .toList();
  }
}
