import 'dart:async';
import 'dart:io';
import 'package:apl_weather_vlad/src/utils/weather_icon.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:provider/provider.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_json.g.dart';

@JsonSerializable(explicitToJson: true)
class Weather {
  String dtKeyId = '1234567890'; //": 1594209600,
  double temp = 200.0; //": 296.92,
  double tempfeelsLike = 200.0; //: 296.12,
  double tempMin = 199.1; //: 294.58,
  double tempMax = 200.9; //: 296.92,
  int pressure = 1000; //: 1006,
  String id = "500"; //": 500,
  String mainWeather = 'Rain'; //"main": "Rain",
  String description = "light rain"; //": "light rain",
  String iconCode; // "weather":"icon": "02n"
  int clouds = 50; //": {"all": 69  },
  double speedWind = 5.0; // "speed": 4.83,
  int degreeWind = 180; //"deg": 328
  double rain = 0; //": {"3h": 2.56 },

  DateTime dtTxt = DateTime.now(); //": "2020-07-08 12:00:00"
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
      this.iconCode,
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
      print("Couldn't read file");
      return null;
    }
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;
    return file.writeAsString('$counter');
  }

  static List<Weather> fromForecastJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);

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

  IconData getIconData() {
    switch (this.iconCode) {
      case '01d':
        return WeatherIcons.clear_day;
      case '01n':
        return WeatherIcons.clear_night;
      case '02d':
        return WeatherIcons.few_clouds_day;
      case '02n':
        return WeatherIcons.few_clouds_day;
      case '03d':
      case '04d':
        return WeatherIcons.clouds_day;
      case '03n':
      case '04n':
        return WeatherIcons.clear_night;
      case '09d':
        return WeatherIcons.shower_rain_day;
      case '09n':
        return WeatherIcons.shower_rain_night;
      case '10d':
        return WeatherIcons.rain_day;
      case '10n':
        return WeatherIcons.rain_night;
      case '11d':
        return WeatherIcons.thunder_storm_day;
      case '11n':
        return WeatherIcons.thunder_storm_night;
      case '13d':
        return WeatherIcons.snow_day;
      case '13n':
        return WeatherIcons.snow_night;
      case '50d':
        return WeatherIcons.mist_day;
      case '50n':
        return WeatherIcons.mist_night;
      default:
        return WeatherIcons.clear_day;
    }
  }
}
