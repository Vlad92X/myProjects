import 'package:apl_weather_vlad/core/constants.dart';
import 'package:apl_weather_vlad/domain/user.dart';
import 'package:apl_weather_vlad/screens/landing.dart';
import 'package:apl_weather_vlad/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(WeatherApp());

// class MyHomePage extends StatefulWidget {
//   final CounterStorage storage = CounterStorage();

//   MyHomePage({Key key}) : super(key: key);

//   final String title = 'World';
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   @override
//   // ignore: must_call_super
//   void initState() {
//     widget.storage.writeCounter(_counter);
//     widget.storage.readCounter().then((int value) {
//       setState(() {
//         _counter = value;
//       });
//     });
//   }

//   Future<File> _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//     return widget.storage.writeCounter(_counter);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           children: <Widget>[
//             Text(
//               "$_counter",
//             ),
//             RaisedButton(
//               child: Text('Increment'),
//               onPressed: _incrementCounter,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().currentUser,
      child: MaterialApp(
        title: "Weather",
        theme: ThemeData(
          primaryColor: ColorTool().bgColorPrimary,
          textTheme: TextTheme(
              title: TextStyle(
            color: Colors.white,
          )),
        ),
        home: LandingPage(),
      ),
    );
  }
}
