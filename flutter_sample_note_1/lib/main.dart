import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFFF3F3F3),
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        home: HomeScreen()
    );
  }
}

