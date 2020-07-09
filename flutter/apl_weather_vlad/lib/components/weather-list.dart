import 'package:apl_weather_vlad/domain/user.dart';
import 'package:apl_weather_vlad/domain/weather.dart';
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

  // @override
  // void dispose() {
  //   if (workoutsStreamSubscription != null) {
  //     workoutsStreamSubscription.cancel();
  //   }
  //   super.dispose();
  // }

  // var db = DatabaseService();
  // StreamSubscription<List<Workout>> workoutsStreamSubscription;
  var weather = List<Weather>();

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

    var filterInfo = Container(
      margin: EdgeInsets.only(top: 3, left: 7, right: 7, bottom: 5),
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.5)),
      height: 40,
      child: RaisedButton(
        child: Row(
          children: <Widget>[
            Icon(Icons.filter_list),
            Text(
              filterText,
              style: TextStyle(),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        onPressed: () {
          setState(() {
            filterHeight = (filterHeight == 0.0 ? 220.0 : 0.0);
          });
        },
      ),
    );
    var levelMenuItems = <String>[
      'Any Level',
      'Beginner',
      'Intermediate',
      'Advanced'
    ].map((String value) {
      return new DropdownMenuItem<String>(
        value: value,
        child: new Text(value),
      );
    }).toList();
    var filterForm = AnimatedContainer(
      margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 7),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SwitchListTile(
                  title: const Text('Only My Workouts'),
                  value: filterOnlyMyWorkouts,
                  onChanged: (bool val) =>
                      setState(() => filterOnlyMyWorkouts = val)),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Level'),
                items: levelMenuItems,
                value: filterLevel,
                onChanged: (String val) => setState(() => filterLevel = val),
              ),
              TextFormField(
                controller: filterTitleController,
                decoration: const InputDecoration(labelText: 'Title'),
                onChanged: (String val) => setState(() => filterTitle = val),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: RaisedButton(
                      onPressed: () {
                        filter();
                      },
                      child:
                          Text("Apply", style: TextStyle(color: Colors.white)),
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: RaisedButton(
                      onPressed: () {
                        filter(clear: true);
                      },
                      child:
                          Text("Clear", style: TextStyle(color: Colors.white)),
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      duration: const Duration(milliseconds: 400),
      curve: Curves.fastOutSlowIn,
      height: filterHeight,
    );
    var widgetsList = Expanded(
      child: ListView.builder(
          itemCount: weather.length,
          itemBuilder: (context, i) {
            return InkWell(
              onTap: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (ctx) => WorkoutDetails(id: weather[i].id)));
              },
              child: Card(
                key: Key(weather[i].id),
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
                    title: Text(weather[i].mainWeather,
                        style: TextStyle(
                            color: Theme.of(context).textTheme.headline6.color,
                            fontWeight: FontWeight.bold)),
                    trailing: Icon(Icons.keyboard_arrow_right,
                        color: Theme.of(context).textTheme.headline6.color),
                    subtitle: CloudyLevel(level: weather[i].mainWeather),
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
