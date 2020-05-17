import 'package:flutter/material.dart';
import 'package:we_pray/src/home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WePray',
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: 20),
          bodyText2: TextStyle(fontSize: 20),
        ),
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}
