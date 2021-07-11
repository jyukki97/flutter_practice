import 'package:flutter/material.dart';
import 'package:flutter_dashboard_web/controllers/MenuController.dart';
import 'package:flutter_dashboard_web/responsive.dart';
import 'package:flutter_dashboard_web/screens/dashboard/dashboard_screen.dart';
import 'package:provider/provider.dart';
import 'components/side_menu.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context
          .read<MenuController>()
          .scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                  child: SideMenu()
              ),
            Expanded(
                flex: 5,
                child: DashboardScreen()
            ),
          ],
        ),
      ),
    );
  }
}

