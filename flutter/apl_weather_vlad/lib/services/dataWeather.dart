//В разработке!!!

// import 'package:apl_weather_vlad/domain/weather.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// _loadWeather (String url)async{
//   final response= await http.get(url);
// if (response.statusCode == 200) {
//     // print(response.body);
//     var allData =
//         (json.decode(response.body) as Map)['main'] as Map<String, dynamic>;
//     var weatherDataList = List<Weather>();
//     allData.forEach((key, value) {});
//   }
// }

// loadDataWeather(URLcomponents data) async {
//   final response = await http.get(
//       'https://api.openweathermap.org/data/2.5/forecast?' + data.urlComponents);
//   if (response.statusCode == 200) {
//     // print(response.body);
//     var allData =
//         (json.decode(response.body) as Map)['main'] as Map<String, dynamic>;
//     var weatherList = List<Weather>();
//     allData.forEach((String key, dynamic val) {
//         var record=Weather(dtKeyId: val//['list']
//         ['dt'] , val['main']))

//     });
//   }
// }

// class URLcomponents {
//   final String key = '91109082ce136ac29dcd539aded331fe';
//   final String type = 'q';
//   final String typeCode = 'appid';

//   String city;
//   URLcomponents({this.city});

//   String get urlComponents => type + "=" + city + "&" + typeCode + "=" + key;
// }
