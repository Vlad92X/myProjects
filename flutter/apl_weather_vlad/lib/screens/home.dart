import 'package:apl_weather_vlad/screens/usersettings.dart';
import 'package:apl_weather_vlad/screens/weather-clock.dart';
import 'package:apl_weather_vlad/screens/weather-day.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int sectionIndex = 0;

  @override
  Widget build(BuildContext context) {
    // var navigationBar = CurvedNavigationBar(
    //   items: const <Widget>[
    //     Icon(Icons.fitness_center),
    //     Icon(Icons.search),
    //   ],
    //   index: 0,
    //   height: 47,
    //   color: Colors.white.withOpacity(0.5),
    //   buttonBackgroundColor: Colors.white,
    //   backgroundColor: Colors.white.withOpacity(0.35),
    //   animationCurve: Curves.easeInOut,
    //   animationDuration: Duration(milliseconds: 500),
    //   onTap: (int index) {
    //     setState(() {
    //       sectionIndex = index;
    //     });
    //   },
    // );

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
            'MaxFit // ${sectionIndex == 0 ? 'Active Workouts' : 'Find Workouts'}'),
        leading: Icon(Icons.keyboard_arrow_down),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                //переход в настройки пользователя
                UserSettings().settings();
              },
              icon: Icon(
                Icons.supervised_user_circle,
                color: Colors.white,
              ),
              label: SizedBox.shrink())
        ],
      ),
      body: sectionIndex == 0 ? WeatherByTheDays() : WeatherByTheClock(),
      // bottomNavigationBar: navigationBar,
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   backgroundColor: Colors.white,
      //   foregroundColor: Theme.of(context).primaryColor,
      //   onPressed: (){
      //     Navigator.push(context, MaterialPageRoute(builder: (ctx) => AddWorkout()));
      //   },
      // ),
    );
  }
}
