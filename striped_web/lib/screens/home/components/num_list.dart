import 'package:flutter/material.dart';
import 'package:striped_web/responsive.dart';

import '../../../constants.dart';

class NumList extends StatelessWidget {
  const NumList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 130,
      margin: EdgeInsets.only(left: Responsive.isDesktop(context) ? 110 : 0),
      padding: EdgeInsets.symmetric(horizontal: Responsive.isMobile(context) ? defaultPadding : 80),
      child: Responsive.isMobile(context)
          ? Column(
        children: [
          SizedBox(height: 30,),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 50,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: defaultPadding * 1.5),
              margin: EdgeInsets.symmetric(vertical: defaultPadding),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: secondaryColor
              ),
              child: Text(
                "Next Page",
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 10,)
        ],
      )
          : Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NumButton(index: 1, isSelected: true,),
          NumButton(index: 2,),
          NumButton(index: 3,),
          NumButton(index: 4,),
          Container(
            width: 43,
            height: 43,
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: defaultPadding / 2),
            child: Text(
              "...",
              style: Theme
                  .of(context)
                  .textTheme
                  .headline6
                  .copyWith(
                  color: bodyTextColor,
                  fontSize: 20,
                  wordSpacing: 40
              ),
            ),
          ),
          NumButton(index: 20,),
          Container(
            alignment: Alignment.center,
            height: 43,
            padding: EdgeInsets.symmetric(horizontal: defaultPadding * 1.5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: secondaryColor
            ),
            child: Text(
              "Next Page",
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class NumButton extends StatelessWidget {
  const NumButton({
    Key key,
    @required this.index,
    this.isSelected = false
  }) : super(key: key);

  final int index;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      hoverColor: Colors.grey,
      child: Container(
        width: 43,
        height: 43,
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: defaultPadding/2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: isSelected ? darkColor : bgColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
            ),
          ],
        ),
        child: Text(
          index.toString(),
          style: Theme.of(context).textTheme.headline6.copyWith(
              color: isSelected ? Colors.white : bodyTextColor,
              fontSize: 13,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}