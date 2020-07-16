// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

List<Weather> _$ForecastFromJson(Map<String, dynamic> json) {
  final weathers = List<Weather>();
  for (final item in json['list']) {
    weathers.add(Weather(
        dtKeyId: item['dt'],
        temp: item['main']['temp'],
        iconCode: item['weather'][0]['icon']));
  }
  return weathers;
}

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return Weather(
    dtKeyId: json['cod'] as String,
    temp: (json['temp'] as num)?.toDouble(),
    tempfeelsLike: (json['feels_like'] as num)?.toDouble(),
    tempMin: (json['temp_min'] as num)?.toDouble(),
    tempMax: (json['temp_max'] as num)?.toDouble(),
    pressure: json['pressure'] as int,
    id: json['id'] as String,
    mainWeather: 'Rain', //(json['main']) as String,
    description: json['description'] as String,
    clouds: json['all'] as int,
    speedWind: (json['speed'] as num)?.toDouble(),
    degreeWind: json['degree'] as int,
    rain: 200.0, //(json['rain'] as num)?.toDouble(),
    dtTxt: DateTime.now(), //json['dt_txt'] == null
    //  ? null
    // : DateTime.parse(json['dt_txt'] as String),
  );
}

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'dtKeyId': instance.dtKeyId,
      'temp': instance.temp,
      'tempfeelsLike': instance.tempfeelsLike,
      'tempMin': instance.tempMin,
      'tempMax': instance.tempMax,
      'pressure': instance.pressure,
      'id': instance.id,
      'mainWeather': instance.mainWeather,
      'description': instance.description,
      'clouds': instance.clouds,
      'speedWind': instance.speedWind,
      'degreeWind': instance.degreeWind,
      'rain': instance.rain,
      'dtTxt': instance.dtTxt?.toIso8601String(),
    };
