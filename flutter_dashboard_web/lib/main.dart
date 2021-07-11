import 'package:flutter/material.dart';
import 'package:flutter_dashboard_web/controllers/MenuController.dart';
import 'package:flutter_dashboard_web/screens/main/main_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Admin Panel',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      home: MultiProvider(providers: [
        ChangeNotifierProvider(
            create: (context) => MenuController()
        )
      ],
        child: MainScreen(),
      ),
    );
  }
}
