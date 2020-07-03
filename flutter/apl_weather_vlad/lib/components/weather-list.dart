import 'package:flutter/material.dart';
import 'package:apl_weather_vlad/domain/weather.dart';

class WeathersList extends StatelessWidget {
  final weather = <Weather>[
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
            itemCount: weather.length,
            itemBuilder: (context, i) {
              return Card(
                elevation: 2.0,
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Container(
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(52, 0, 85, 0.9)),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    leading: Container(
                      padding: EdgeInsets.only(right: 12),
                      child: Icon(
                        Icons.cloud_circle,
                        color: Theme.of(context).textTheme.title.color,
                      ),
                      decoration: BoxDecoration(
                          border: Border(
                              right:
                                  BorderSide(width: 1, color: Colors.white24))),
                    ),
                    title: Text(
                      weather[i].title,
                      style: TextStyle(
                          color: Theme.of(context).textTheme.title.color,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(Icons.map,
                        color: Theme.of(context).textTheme.title.color),
                    subtitle: subtitle(context, weather[i]),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

Widget subtitle(BuildContext context, Weather workout) {
  var color = Colors.grey;
  double indicatorLevel = 0;

  switch (workout.level) {
    case 'Beginner':
      color = Colors.green;
      indicatorLevel = 0.23;
      break;
    case 'Intermediate':
      color = Colors.yellow;
      indicatorLevel = 0.66;
      break;
    case 'Advanced':
      color = Colors.red;
      indicatorLevel = 1;
      break;
  }
  return Row(
    children: <Widget>[
      Expanded(
        flex: 1,
        child: LinearProgressIndicator(
          backgroundColor: Theme.of(context).textTheme.title.color,
          value: indicatorLevel,
          valueColor: AlwaysStoppedAnimation(color),
        ),
      ),
      SizedBox(
        width: 10,
      ),
      Expanded(
        flex: 3,
        child: Text(
          workout.level,
          style: TextStyle(
            color: Theme.of(context).textTheme.title.color,
          ),
        ),
      ),
    ],
  );
}
