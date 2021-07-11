import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_blog/constants.dart';
import 'package:portfolio_blog/screens/main/components/side_menu.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key key, this.children}) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                  child: SideMenu()
              ),
              Expanded(
                flex: 7,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ...children,
                      ],
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}