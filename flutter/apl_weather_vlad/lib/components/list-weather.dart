// import 'package:apl_weather_vlad/domain/listoffermodel.dart';
// import 'package:flutter/material.dart';
// import 'package:apl_weather_vlad/domain/weather.dart';

// class WeathersList extends StatefulWidget {
//   static List<ListOfferModel> data = [];

//   @override
//   _WeathersListState createState() => _WeathersListState();
// }

// class _WeathersListState extends State<WeathersList> {
//   List<Weather> weather = <Weather>[
//     Weather(
//         cod: 'weather1', message: 1, cnt: 0, listOfferModel: WeathersList.data),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

// Widget subtitle(BuildContext context, Weather workout) {
//   var color = Colors.grey;
//   double indicatorLevel = 0;

//   switch (workout.message) {
//     case 0:
//       color = Colors.green;
//       indicatorLevel = 0.23;
//       break;
//     case 1:
//       color = Colors.yellow;
//       indicatorLevel = 0.66;
//       break;
//     case 2:
//       color = Colors.red;
//       indicatorLevel = 1;
//       break;
//   }
//   return Row(
//     children: <Widget>[
//       Expanded(
//         flex: 1,
//         child: LinearProgressIndicator(
//           backgroundColor: Theme.of(context).textTheme.title.color,
//           value: indicatorLevel,
//           valueColor: AlwaysStoppedAnimation(color),
//         ),
//       ),
//       SizedBox(
//         width: 10,
//       ),
//       Expanded(
//         flex: 3,
//         child: Text(
//           ' tempF.',
//           style: TextStyle(
//             color: Theme.of(context).textTheme.title.color,
//           ),
//         ),
//       ),
//     ],
//   );
// }

// //бывший код
// // class WeathersList extends StatelessWidget {

// //   static List<ListOfferModel> data = <ListOfferModel>[
// //     ListOfferModel(temp: 25.0),
// //     ListOfferModel(temp: 41.0)
// //   ];
// //   List<Weather> weather = <Weather>[
// //     Weather(cod: 'weather1', message: 1, cnt: 0, listOfferModel: data),
// //   ];

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       child: Container(
// //         child: ListView.builder(
// //             itemCount: weather.length,
// //             itemBuilder: (context, i) {
// //               return Card(
// //                 elevation: 2.0,
// //                 margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
// //                 child: Container(
// //                   decoration:
// //                       BoxDecoration(color: Color.fromRGBO(52, 0, 85, 0.9)),
// //                   child: ListTile(
// //                     contentPadding: EdgeInsets.symmetric(
// //                       horizontal: 10,
// //                     ),
// //                     leading: Container(
// //                       padding: EdgeInsets.only(right: 12),
// //                       child: Icon(
// //                         Icons.cloud_circle,
// //                         color: Theme.of(context).textTheme.title.color,
// //                       ),
// //                       decoration: BoxDecoration(
// //                           border: Border(
// //                               right:
// //                                   BorderSide(width: 1, color: Colors.white24))),
// //                     ),
// //                     title: Text(
// //                       weather[i].cod,
// //                       style: TextStyle(
// //                           color: Theme.of(context).textTheme.title.color,
// //                           fontWeight: FontWeight.bold),
// //                     ),
// //                     trailing: Icon(Icons.map,
// //                         color: Theme.of(context).textTheme.title.color),
// //                     subtitle: subtitle(context, weather[i]),
// //                   ),
// //                 ),
// //               );
// //             }),
// //       ),
// //     );
// //   }
// // }

// // Widget subtitle(BuildContext context, Weather workout) {
// //   var color = Colors.grey;
// //   double indicatorLevel = 0;

// //   switch (workout.message) {
// //     case 0:
// //       color = Colors.green;
// //       indicatorLevel = 0.23;
// //       break;
// //     case 1:
// //       color = Colors.yellow;
// //       indicatorLevel = 0.66;
// //       break;
// //     case 2:
// //       color = Colors.red;
// //       indicatorLevel = 1;
// //       break;
// //   }
// //   return Row(
// //     children: <Widget>[
// //       Expanded(
// //         flex: 1,
// //         child: LinearProgressIndicator(
// //           backgroundColor: Theme.of(context).textTheme.title.color,
// //           value: indicatorLevel,
// //           valueColor: AlwaysStoppedAnimation(color),
// //         ),
// //       ),
// //       SizedBox(
// //         width: 10,
// //       ),
// //       Expanded(
// //         flex: 3,
// //         child: Text(
// //           ' tempF.',
// //           style: TextStyle(
// //             color: Theme.of(context).textTheme.title.color,
// //           ),
// //         ),
// //       ),
// //     ],
// //   );
// // }
