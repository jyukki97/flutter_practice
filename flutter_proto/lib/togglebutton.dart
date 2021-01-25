import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToggleButton extends StatelessWidget {
  double position;
  String buttonImage;
  bool isCliced;

  ToggleButton({this.position, this.isCliced});

  @override
  Widget build(BuildContext context) {
    switch (position.toInt()) {
      case 10:
        buttonImage = "seed";
        break;
      case 100:
        buttonImage = "sprout";
        break;
      case 190:
        buttonImage = "sakura";
        break;
    }
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
              blurRadius: 10, color: Colors.grey, offset: Offset(0.0, 0))
        ],
      ),
      child: CircleAvatar(
        radius: 35,
        backgroundColor: isCliced ? Colors.red : Colors.white,
        child: Image.asset("assets/icons/$buttonImage.png", scale: 13,
          color: Color(0xFFe9a49e),),
      ),
    );
  }
}