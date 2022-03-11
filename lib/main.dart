import 'package:flutter/material.dart';
import 'package:daily_bugle/widgets/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.red),
        title: 'Daily Bugle',
        home: const Home());
  }
}

// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.red,
//       ),
//       title: 'Daily Bugle',
//       home: MyApp(),
//       // child: Container(
//       //   decoration: BoxDecoration(
//       //       gradient: LinearGradient(
//       //     begin: Alignment.topRight,
//       //     end: Alignment.bottomLeft,
//       //     colors: [
//       //       Colors.blue,
//       //       Colors.red,
//       //     ],
//       //   )),
//       //   child: Center(
//       //     child: Text(
//       //       'Hello Gradient!',
//       //       style: TextStyle(
//       //         fontSize: 48.0,
//       //         fontWeight: FontWeight.bold,
//       //         color: Colors.white,
//       //       ),
//       //     ),
//       //   ),
//       // ),
//     );
//   }
// }
