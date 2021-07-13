import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'divider_with_shadow.dart';

class CustomCalendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var firstTime = DateTime(now.year, now.month, 1);
    var lastTime = DateTime(now.year, now.month, 31);
    while (lastTime.month != now.month) {
      lastTime = DateTime(lastTime.year, lastTime.month, lastTime.day - 1);
    }
    List<String> selected = ["6", "10", now.day.toString(), "23", "25"];
    List<String> day = [];
    for (var i = 1; i < firstTime.weekday; i++)
      day.add(" ");
    for (var i = 1; i <= lastTime.day; i++)
      day.add(i.toString());
    while (day.length % 7 != 0)
      day.add(" ");
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: defaultPadding * 2),
      padding: EdgeInsets.symmetric(
          vertical: defaultPadding / 2, horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
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
      child: Column(
        children: [
          CalenderTitle(nowMonth: now.month-1, year: now.year),
          DividerWithShadow(),
          WeekRow(),
          DividerWithShadow(),
          for(var index = 0; index != (day.length ~/ 7); index++)
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      for(var i = 0; i < 7; i++)
                        if(day.length > (index * 7 + i))
                          if (selected.contains(day[index * 7 + i]))
                            ClickNumBox(now: now, day: day, index: index, i: i)
                          else
                            NumBox(num: day[index * 7 + i],),
                    ],
                  ),
                ),
                if (index < (day.length ~/ 7) - 1)
                  DividerWithShadow()
              ],
            )
        ],
      ),
    );
  }
}

class CalenderTitle extends StatelessWidget {
  CalenderTitle({
    Key key,
    @required this.nowMonth,
    @required this.year,
  }) : super(key: key);

  final List<String> month = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October"	,
    "November",
    "December"
  ];

  final int nowMonth;
  final int year;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        month[nowMonth] + " $year",
        style: Theme
            .of(context)
            .textTheme
            .bodyText1
            .copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}

class WeekRow extends StatelessWidget {
  WeekRow({
    Key key,
  }) : super(key: key);

  final List<String> week = ["M", "T", "W", "T", "F", "S" ,"S"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for(var day in week)
            Container(
              width: 18,
              height: 18,
              alignment: Alignment.center,
              child: Text(
                day,
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12
                ),
              ),
            )
        ],
      ),
    );
  }
}

class ClickNumBox extends StatelessWidget {
  const ClickNumBox({
    Key key,
    @required this.now,
    @required this.day,
    @required this.index,
    @required this.i,
  }) : super(key: key);

  final DateTime now;
  final List<String> day;
  final int index;
  final int i;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (event) {},
      hoverColor: Colors.white.withOpacity(0.1),
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        width: 18,
        height: 18,
        padding: EdgeInsets.all(2),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
              Radius.circular(5)),
          color: now.day.toString() == day[index * 7 + i] ? secondaryColor : Colors.transparent,
        ),
        child: Text(
          day[index * 7 + i],
          style: Theme
              .of(context)
              .textTheme
              .bodyText1
              .copyWith(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}

class NumBox extends StatelessWidget {
  const NumBox({
    Key key,
    @required this.num,
  }) : super(key: key);

  final String num;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      padding: EdgeInsets.all(2),
      alignment: Alignment.center,
      child: Text(
        num,
        style: Theme
            .of(context)
            .textTheme
            .bodyText1
            .copyWith(
            color: Colors.grey,
            fontSize: 12,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
