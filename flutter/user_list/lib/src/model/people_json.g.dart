// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'people.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

List<People> _$PeopleListFromJson(Map<String, dynamic> json) {
  final people = List<People>();
  for (final item in json['list']) {
    people.add(
        People(gender: item['gender'], email: item['email'], nat: item['nat']));
  }
  return people;
}

People _$PeopleFromJson(Map<String, dynamic> json) {
  return People(
    gender: json['gender'] as String,
    email: json['email'] as String,
    nat: (json['nat']) as String,
  );
}

Map<String, dynamic> _$PeopleToJson(People instance) => <String, dynamic>{
      'gender': instance.gender,
      'email': instance.email,
      'nat': instance.nat,
    };
