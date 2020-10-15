import 'dart:async';
import 'dart:io';
import 'package:apl_weather_vlad/src/utils/weather_icon.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:provider/provider.dart';
import 'package:json_annotation/json_annotation.dart';

part 'people_json.g.dart';

@JsonSerializable(explicitToJson: true)
class People {
  String gender;
  String nat;
  String email;

  People({
    this.gender,
    this.nat,
    this.email,
  });

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/people.txt');
  }

  Future<People> readPeople() async {
    try {
      final file = await _localFile;
      String contents = await file.readAsString();

      return People.parse(contents);
    } catch (e) {
      print("Couldn't read file");
      return null;
    }
  }

  Future<File> writePeople(int people) async {
    final file = await _localFile;
    return file.writeAsString('$people');
  }

  static List<People> fromPeopleJson(Map<String, dynamic> json) =>
      _$PeopleListFromJson(json);

  factory People.fromJson(Map<String, dynamic> json) => _$PeopleFromJson(json);

  Map<String, dynamic> toJson() => _$PeopleToJson(this);

  static People parse(String contents) {
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
