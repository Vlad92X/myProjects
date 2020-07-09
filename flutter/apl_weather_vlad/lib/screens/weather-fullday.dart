import 'package:apl_weather_vlad/core/constants.dart';
import 'package:apl_weather_vlad/domain/weather.dart';
import 'package:flutter/material.dart';

class AllWeatherForecastForDay extends StatefulWidget {
  final Weather day;
  AllWeatherForecastForDay({Key key, this.day}) : super(key: key);
  @override
  _AllWeatherForecastForDayState createState() =>
      _AllWeatherForecastForDayState();
}

class _AllWeatherForecastForDayState extends State<AllWeatherForecastForDay> {
  Weather day = Weather();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MaxFit // Create Day Plan'),
        actions: <Widget>[
          //SaveButton(onPressed: _saveDayPlan),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(color: ColorTool().bgColorActive),
            child: Text('' //day.printDay
                )),
      ),
    );
  }
}
