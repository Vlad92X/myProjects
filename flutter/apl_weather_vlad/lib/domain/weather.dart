import 'package:apl_weather_vlad/screens/home.dart';
import 'package:flutter/material.dart';

class Weather {
  String title;
  String author;
  String description;
  String level;

  Weather({this.title, this.author, this.description, this.level});
}

class WorkoutsList extends StatelessWidget {
  final workouts = <Weather>[
    Weather(
        title: 'weather1',
        author: "Max1",
        description: 'Test worcout1',
        level: 'Beginner'),
    Weather(
        title: 'weather2',
        author: "Max2",
        description: 'Test worcout2',
        level: 'Intermediate'),
    Weather(
        title: 'weather3',
        author: "Max3",
        description: 'Test worcout3',
        level: 'Advanced'),
    Weather(
        title: 'weather4',
        author: "Max4",
        description: 'Test worcout4',
        level: 'Beginner'),
    Weather(
        title: 'weather5',
        author: "Max5",
        description: 'Test worcout5',
        level: 'Intermediate'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: ListView.builder(
            itemCount: workouts.length,
            itemBuilder: (context, i) {
              return Card(
                elevation: 2.0,
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Container(
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(50, 65, 85, 0.9)),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    leading: Container(
                      padding: EdgeInsets.only(right: 12),
                      child: Icon(
                        Icons.fitness_center,
                        color: Theme.of(context).textTheme.title.color,
                      ),
                      decoration: BoxDecoration(
                          border: Border(
                              right:
                                  BorderSide(width: 1, color: Colors.white24))),
                    ),
                    title: Text(
                      workouts[i].title,
                      style: TextStyle(
                          color: Theme.of(context).textTheme.title.color,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right,
                        color: Theme.of(context).textTheme.title.color),
                    subtitle: subtitle(context, workouts[i]),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
