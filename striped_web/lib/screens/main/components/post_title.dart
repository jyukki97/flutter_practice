import 'package:flutter/material.dart';

import '../../../constants.dart';

class PostTitle extends StatelessWidget {
  const PostTitle({
    Key key,
    @required this.title,
    this.isSelected = false
  }) : super(key: key);

  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    if(isSelected)
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: defaultPadding / 2, horizontal: defaultPadding),
        margin: EdgeInsets.symmetric(vertical: defaultPadding/2),
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
        child: Text(title,
          style: Theme.of(context).textTheme.bodyText1.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
        ),
      );
    else
      return Padding(
        padding: EdgeInsets.symmetric(vertical: defaultPadding/2),
        child: InkWell(
          onTap: (){},
          onHover: (event){},
          hoverColor: Colors.white.withOpacity(0.1),
          customBorder:  RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: defaultPadding / 2, horizontal: defaultPadding),
            child: Text(title,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontSize: 15,
                  color: Colors.white.withOpacity(0.8)
              ),
            ),
          ),
        ),
      );
  }
}