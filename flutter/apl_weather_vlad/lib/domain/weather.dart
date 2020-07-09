import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class Weather {
  String dtKeyId; //": 1594209600,
  double temp; //": 296.92,
  double tempfeelsLike; //: 296.12,
  double tempMin; //: 294.58,
  double tempMax; //: 296.92,
  int pressure; //: 1006,
  String id; //": 500,
  String mainWeather; //"main": "Rain",
  String description; //": "light rain",
  int clouds; //": {"all": 69  },
  double speedWind; // "speed": 4.83,
  int degreeWind; //"deg": 328
  double rain = 0; //": {"3h": 2.56 },
  DateTime dtTxt; //": "2020-07-08 12:00:00"
  DateTime get dateTime => dtTxt;
  String get printDay {
    String weekDay;
    switch (dtTxt.weekday) {
      case 1:
        weekDay = '  Mo ';
        break;
      case 2:
        weekDay = '  Tu ';
        break;
      case 3:
        weekDay = '  We ';
        break;
      case 4:
        weekDay = '  Th ';
        break;
      case 5:
        weekDay = '  Fr ';
        break;
      case 6:
        weekDay = '  Sa ';
        break;
      case 7:
        weekDay = '  Su ';
        break;
    }

    return weekDay;
  }

  String get printTime =>
      (dtTxt.hour < 10 ? '0' + dtTxt.hour.toString() : dtTxt.hour.toString()) +
      ':' +
      (dtTxt.minute < 10
          ? '0' + dtTxt.minute.toString()
          : dtTxt.minute.toString());

  Weather(
      {this.dtKeyId,
      this.temp,
      this.tempfeelsLike,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.id,
      this.mainWeather,
      this.description,
      this.clouds,
      this.speedWind,
      this.degreeWind,
      this.rain,
      this.dtTxt});

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/weather.txt');
  }

  Future<Weather> readWeather() async {
    try {
      final file = await _localFile;
      String contents = await file.readAsString();

      return Weather.parse(contents);
    } catch (e) {
      return null;
    }
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;
    return file.writeAsString('$counter');
  }

  static Weather parse(String contents) {
    //   return Weather( dtKey: contents.('dtKey') as String,
    //       mainDataTemp: MainDataWeather(
    //           temp: contents['temp'] as double,
    //           feelsLike: 296.12,
    //           tempMin: 294.58,
    //           tempMax: 296.92,
    //           pressure: 1006),
    //       id: '500',
    //       mainWeather: "Rain",
    //       description: "light rain",
    //       clouds: 69,
    //       wind: Wind(speed: 4.83, degree: 328),
    //       rain: 2.56,
    //       dtTxt: DateTime.parse("2020-07-08 12:00:00"))
  }
}

class ForecastForDay extends Weather {}

class ForecastForClock extends Weather {}
