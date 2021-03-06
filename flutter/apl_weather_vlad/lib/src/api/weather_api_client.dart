// import 'package:meta/meta.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:apl_weather_vlad/src/model/weather.dart';
// import 'package:apl_weather_vlad/src/api/http_exeption.dart';

// class WeatherApiClient {
//   static const baseUrl = 'http://api.openweathermap.org';
//   final apiKey;
//   final http.Client httpClient;

//   WeatherApiClient({@required this.httpClient, this.apiKey})
//       : assert(httpClient != null),
//         assert(apiKey != null);

//   Future<String> getCityNameFromLocation(
//       {double latitude, double longitude}) async {
//     final url =
//         '$baseUrl/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey';
//     print('fetching $url');
//     final res = await this.httpClient.get(url);
//     if (res.statusCode != 200) {
//       throw HttpException(res.statusCode, "unable to fetch weather data");
//     }
//     final weatherJson = json.decode(res.body);
//     return weatherJson['name'];
//   }

//   Future<Weather> getWeatherData(String cityName) async {
//     final url = '$baseUrl/data/2.5/weather?q=$cityName&appid=$apiKey';
//     print('fetching $url');
//     final res = await this.httpClient.get(url);
//     if (res.statusCode != 200) {
//       throw HttpException(res.statusCode, "unable to fetch weather data");
//     }
//     final weatherJson = json.decode(res.body);
//     return Weather.fromJson(weatherJson);
//   }

//   Future<List<Weather>> getForecast(String cityName) async {
//     final url = '$baseUrl/data/2.5/forecast?q=$cityName&appid=$apiKey';
//     print('fetching $url');
//     final res = await this.httpClient.get(url);
//     if (res.statusCode != 200) {
//       throw HttpException(res.statusCode, "unable to fetch weather data");
//     }
//     final forecastJson = json.decode(res.body);
//     List<Weather> weathers = Weather.fromForecastJson(forecastJson);
//     return weathers;
//   }
// }
