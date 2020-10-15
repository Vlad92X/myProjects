// В разработке!!!

// import 'package:apl_weather_vlad/src/api/api_keys.dart';
import 'package:apl_weather_vlad/src/model/people.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Future<APIResponse<List<NoteForListing>>> getNotesList() {
Future<List<People>> loadDataWeather() {
  return http.get('https://randomuser.me/api/?results=20').then((data) {
    if (data.statusCode == 200) {
      final jsonData = json.decode(data.body);
      final notes = <People>[];
      for (var item in jsonData) {
        notes.add(People.fromJson(item));
      }
      return List<People>();
    }
    return List<People>();
  }).catchError((_) => List<People>());
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
