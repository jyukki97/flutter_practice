import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color(0x30edb9b5)
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
        primaryColor: Color(0xFFFDAFAB),
        accentColor: Color(0xFFB6E3E9)
      ),
      home: HomeScreen()
    );
  }
}

