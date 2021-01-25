import 'package:flutter/material.dart';
import 'package:flutter_slider/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.red
      ),
      home: HomeScreenBody(),
    );
  }
}