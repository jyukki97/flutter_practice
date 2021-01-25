import 'package:flutter/material.dart';
import 'package:flutter_circle_graph/chart_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

  return MaterialApp(
  title: 'Chart Demo',
  theme: ThemeData(
  primarySwatch: Colors.blue,
  ),
  home: ChartPage(),
  debugShowCheckedModeBanner: false,
  );
  }
}