import 'package:flutter/material.dart';

class DividerWithShadow extends StatelessWidget {
  const DividerWithShadow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.0,
      margin: EdgeInsets.symmetric(vertical: 3),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0.1,
            blurRadius: 0.1,
            offset: Offset(0, 2),
          ),
        ],
      ),
    );
  }
}