import 'package:apl_weather_vlad/src/domain/user.dart';
import 'package:apl_weather_vlad/src/model/people.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WeatherList extends StatefulWidget {
  @override
  _WeatherListState createState() => _WeatherListState();
}

class _WeatherListState extends State<WeatherList> {
  User user;

  @override
  void initState() {
    filter(clear: true);
    super.initState();
  }

  var weather = List<People>();

  var filterHeight = 0.0;
  var filterText = '';
  var filterOnlyMyWorkouts = false;
  var filterTitle = '';
  var filterLevel = 'Any Level';
  var filterTitleController = TextEditingController();

  void filter({bool clear = false}) {
    if (clear) {
      filterOnlyMyWorkouts = false;
      filterTitle = '';
      filterLevel = 'Any Level';
      filterTitleController.clear();
    }

    setState(() {
      filterText = filterOnlyMyWorkouts ? 'My Workouts' : 'All workouts';
      filterText += '/' + filterLevel;
      if (filterTitle.isNotEmpty) filterText += '/' + filterTitle;
      filterHeight = 0;
    });

    // loadData();
  }

  // Future<void> loadData() async {
  //   var stream = db.getWorkouts(
  //       author: filterOnlyMyWorkouts ? user.id : null,
  //       level: filterLevel != 'Any Level' ? filterLevel : null);

  //   workoutsStreamSubscription = stream.listen((List<Weather> data) {
  //     setState(() {
  //       workouts = data;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    user = Provider.of<User>(context);

    var widgetsList = Expanded(
      child: ListView.builder(
          itemCount: weather.length,
          itemBuilder: (context, i) {
            return InkWell(
              onTap: () {},
              child: Card(
                key: Key(weather[i].nat),
                elevation: 2.0,
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Container(
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(50, 65, 85, 0.9)),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    leading: Container(
                      padding: EdgeInsets.only(right: 12),
                      child: Icon(Icons.fitness_center,
                          color: Theme.of(context).textTheme.headline6.color),
                      decoration: BoxDecoration(
                          border: Border(
                              right:
                                  BorderSide(width: 1, color: Colors.white24))),
                    ),
                    title: Text(weather[i].nat,
                        style: TextStyle(
                            color: Theme.of(context).textTheme.headline6.color,
                            fontWeight: FontWeight.bold)),
                    trailing: Icon(Icons.keyboard_arrow_right,
                        color: Theme.of(context).textTheme.headline6.color),
                    subtitle: CloudyLevel(level: weather[i].nat),
                  ),
                ),
              ),
            );
          }),
    );

    return Column(children: [
      widgetsList,
    ]);
  }
}

class CloudyLevel extends StatelessWidget {
  final String level;
  const CloudyLevel({Key key, @required this.level}) : super(key: key);

  Widget getLevel(BuildContext context, String level) {
    var color = Colors.grey;
    double indicatorLevel = 0;

    switch (level) {
      case 'Rain':
        color = Colors.green;
        indicatorLevel = 0.25;
        break;
      case '26 - 50':
        color = Colors.yellow;
        indicatorLevel = 0.50;
        break;
      case '51 - 75':
        color = Colors.orange;
        indicatorLevel = 0.75;
        break;
      case '76 - 100':
        color = Colors.red;
        indicatorLevel = 1;
        break;
    }

    return Row(
      children: <Widget>[
        Expanded(
            flex: 1,
            child: LinearProgressIndicator(
                backgroundColor: Theme.of(context).textTheme.headline6.color,
                value: indicatorLevel,
                valueColor: AlwaysStoppedAnimation(color))),
        SizedBox(width: 10),
        Expanded(
            flex: 3,
            child: Text(level,
                style: TextStyle(
                    color: Theme.of(context).textTheme.headline6.color)))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: getLevel(context, level),
    );
  }
}
