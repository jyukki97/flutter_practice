import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:striped_web/constants.dart';
import 'package:striped_web/controllers/menu_contoroller.dart';
import 'package:striped_web/responsive.dart';
import 'package:striped_web/screens/home/home_screen.dart';
import 'package:provider/provider.dart';
import 'components/side_menu.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SingleChildScrollView(child: SideMenu()),
      key: context.read<MenuController>().scaffoldKey,
      appBar: Responsive.isMobile(context)
          ? AppBar(
        leading: GestureDetector(
          onTap: context.read<MenuController>().controlMenu,
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.all(Radius.circular(5))
            ),
            child: Icon(Icons.menu_rounded),
          ),
        ),
        title: Text(
            "STRIPED",
          style: Theme.of(context).textTheme.headline6.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      )
          : null,
      body: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if(!Responsive.isMobile(context))
                SideMenu(),
              Expanded(
                  child: HomeScreen()
              ),
            ],
          ),
        ),
      ),
    );
  }
}