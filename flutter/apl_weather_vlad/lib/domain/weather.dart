// import 'package:http/http.dart' as http;
// import 'dart:convert';

import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class Weather {
  String dtKey; //": 1594209600,
  MainDataWeather mainDataTemp;
  /*"main": { "temp": 296.92,
                                            "feels_like": 296.12,
                                            "temp_min": 294.58,
                                            "temp_max": 296.92,
                                            "pressure": 1006, }*/
  String id; //": 500,
  String mainWeather; //"main": "Rain",
  String description; //": "light rain",
  int clouds; //": {"all": 69  },
  Wind wind; //  "wind": {speed, degree}
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
      {this.dtKey,
      this.mainDataTemp,
      this.id,
      this.mainWeather,
      this.description,
      this.clouds,
      this.wind,
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

  static Future<Weather> parse(String contents) {}
}

class MainDataWeather {
  double temp; //": 296.92,
  double feelsLike; //: 296.12,
  double tempMin; //: 294.58,
  double tempMax; //: 296.92,
  int pressure; //: 1006,
  MainDataWeather(
      {this.temp, this.feelsLike, this.tempMin, this.tempMax, this.pressure});
}

class Wind {
  double speed; // "speed": 4.83,
  int degree; //"deg": 328
  Wind({this.speed, this.degree});
}

class URLcomponents {
  final String key = '91109082ce136ac29dcd539aded331fe';
  final String type = 'q';
  final String typeCode = 'appid';

  String city;
  URLcomponents({this.city});

  String get urlComponents => type + "=" + city + "&" + typeCode + "=" + key;
}

// loadDataWeather(URLcomponents data) async {
//   final response = await http.get(
//       'https://api.openweathermap.org/data/2.5/forecast?' + data.urlComponents);
//   if (response.statusCode == 200) {
//     // print(response.body);
//     var allData =
//         (json.decode(response.body) as Map)['main'] as Map<String, dynamic>;
//     var weatherDataList = List<Weather>();
//     allData.forEach((key, value) {});
//   }
// }

class ForecastForDay extends Weather {}

class ForecastForClock extends Weather {}
