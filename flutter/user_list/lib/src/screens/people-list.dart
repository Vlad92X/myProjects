import 'package:apl_weather_vlad/src/model/people.dart';
import 'package:apl_weather_vlad/src/screens/profile.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PeopleListWidget extends StatefulWidget {
  List<People> listWeather = [];
  PeopleListWidget({Key key, this.listWeather}) : super(key: key);

  @override
  _PeopleListWidgetState createState() => _PeopleListWidgetState();
}

class _PeopleListWidgetState extends State<PeopleListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: _buildList(context, widget.listWeather),
      ),
    );
  }

  List<People> listPeople = [
    People(email: "efmwoefmnpowemfm@ded.ede", nat: "Rus", gender: "Male"),
    People(email: "cmwoefmdcm-fm@ded.ede", nat: "Rus", gender: "Male"),
    People(email: "dsfmwoefm,dcdnpowemfm@ded.ede", nat: "Rus", gender: "Male"),
  ];

  List<Widget> _buildList(BuildContext context, List<People> people) {
    people = listPeople;

    return people
        .map((People p) => ListTile(
              title: Text(p.nat),
              leading: Text(
                p.gender,
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              subtitle: Text('temp: ${p.nat}f'),
              trailing: Column(children: <Widget>[
                Icon(
                  Icons.access_alarm,
                  color: Colors.black,
                  size: 18,
                ),
                Text(p.email),
              ]),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => ProfileWidget()));
              },
            ))
        .toList();
  }
}
