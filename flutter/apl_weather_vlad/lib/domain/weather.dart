import 'package:apl_weather_vlad/domain/listoffermodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Weather {
  String dt; //": 1594209600,
  MainDataWeather mainData;
  /*"main": { "temp": 296.92,
                                            "feels_like": 296.12,
                                            "temp_min": 294.58,
                                            "temp_max": 296.92,
                                            "pressure": 1006, }*/
  int id; //": 500,
  String mainText; //"main": "Rain",
  String description; //": "light rain",
  int clouds; //": {"all": 69  },
  Wind wind; //  "wind": {speed, degree}
  double rain = 0; //": {"3h": 2.56 },
  String dtTxt; //": "2020-07-08 12:00:00"

  Weather({
    this.dt,
    this.mainData,
  });
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

loadDataWeather(URLcomponents data) async {
  final response = await http.get(
      'https://api.openweathermap.org/data/2.5/forecast?' + data.urlComponents);
  if (response.statusCode == 200) {
    // print(response.body);
    var allData =
        (json.decode(response.body) as Map)['main'] as Map<String, dynamic>;
    var weaterDataList = List<Weather>();
    allData.forEach((key, value) {});
  }
}

/*
    "cod": "200",
    "message": 0,
    "cnt": 40,
    "list": [
        {
            "dt": 1594209600,
            "main": {
                "temp": 296.92,
                "feels_like": 296.12,
                "temp_min": 294.58,
                "temp_max": 296.92,
                "pressure": 1006,
                "sea_level": 1007,
                "grnd_level": 989,
                "humidity": 68,
                "temp_kf": 2.34
            },
            "weather": [
                {
                    "id": 500,
                    "main": "Rain",
                    "description": "light rain",
                    "icon": "10d"
                }
            ],
            "clouds": {
                "all": 69
            },
            "wind": {
                "speed": 4.83,
                "deg": 328
            },
            "rain": {
                "3h": 2.56
            },
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2020-07-08 12:00:00"
        },
        
        */
