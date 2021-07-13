import 'package:flutter/material.dart';

import '../../../constants.dart';

class SideText extends StatelessWidget {
  const SideText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding/2),
        margin: EdgeInsets.symmetric(vertical: defaultPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: darkColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
            ),
            BoxShadow(
              color: darkColor,
              spreadRadius: -12.0,
              blurRadius: 12.0,
            ),
          ],
        ),
        child: Text.rich(
          TextSpan(
            text: "Striped:",
            style: Theme
                .of(context)
                .textTheme
                .bodyText1
                .copyWith(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              height: 2
            ),
            children: [
              TextSpan(
                  text: " A free and fully responsive HTML5 site template designed by ",
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontSize: 15,
                      color: Colors.grey,
                      height: 2
                  )
              ),
              TextSpan(text: "AJ",),
              TextSpan(text: " for ",
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontSize: 13,
                      color: Colors.grey,
                      height: 2
                  )
              ),
              TextSpan(text: "HTML5 UP"),
            ],
          ),
        )
    );
  }
}