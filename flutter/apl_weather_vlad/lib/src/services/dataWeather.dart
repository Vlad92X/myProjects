// В разработке!!!

import 'package:apl_weather_vlad/src/api/api_keys.dart';
import 'package:apl_weather_vlad/src/model/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Future<APIResponse<List<NoteForListing>>> getNotesList() {
Future<List<Weather>> loadDataWeather(URLcomponents data) {
  return http
      .get('https://api.openweathermap.org/data/2.5/forecast?' +
          data.urlComponents)
      .then((data) {
    if (data.statusCode == 200) {
      final jsonData = json.decode(data.body);
      final notes = <Weather>[];
      for (var item in jsonData) {
        notes.add(Weather.fromJson(item));
      }
      return List<Weather>();
    }
    return List<Weather>();
  }).catchError((_) => List<Weather>());
}

// Future<List<Weather>> loadDataWeather2(URLcomponents data) async {
//   final response = await http.get(
//       'https://api.openweathermap.org/data/2.5/forecast?' + data.urlComponents);
//   if (response.statusCode == 200) {
//     var allData = json.decode(response.body);
//     var weatherList = List<Weather>();
//    for (var item in allData) {
//         weatherList.add(Weather.fromJson(item));
//       }
//       return List<Weather>();
//     }
//     return List<Weather>();

//       // dtKeyId: val["cod"] as String,
//       // temp: val['main']['temp'] as double,
//       // tempfeelsLike: val['main']['feels_like'],
//       // tempMin: val['main']['temp_min'],
//       // tempMax: val['main']['temp_max'],
//       // pressure: val['main']['pressure'],
//       // id: val['weather']['id'],
//       // mainWeather: val['weather']['main'],
//       // description: val['weather']['description'],
//       // clouds: val['clouds']['all'],
//       // speedWind: val['wind']['speed'],
//       // degreeWind: val['wind']['deg'],
//       // dtTxt: val['dt_txt']);
//       print('record= ' + Weather.fromJson(allData).toString());
//       print('${Weather.fromJson(allData).dtTxt.toString()}');
//       weatherList.add(record);
//     });
//     print('weatherList2: $weatherList');
//   }
// }

class URLcomponents {
  final String apiSite = 'https://api.openweathermap.org/data/2.5/forecast?';
  final String type = 'q';
  final String typeCode = 'appid';

  String city;
  URLcomponents({this.city});

  String get urlComponents =>
      apiSite +
      type +
      "=" +
      city +
      "&" +
      typeCode +
      "=" +
      ApiKey.OPEN_WEATHER_MAP;
}
