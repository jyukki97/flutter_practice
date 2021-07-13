import 'package:flutter/material.dart';

import '../../../constants.dart';

class SideTextField extends StatelessWidget {
  const SideTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: defaultPadding),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10),),
          ),
          hintText: 'Search',
          hintStyle: Theme.of(context).textTheme.bodyText1.copyWith(
              fontSize: 15,
              color: Colors.grey
          ),
          suffixIcon: Icon(Icons.search_rounded, size: 25, color: Colors.grey,),
        ),
        style: Theme.of(context).textTheme.bodyText1.copyWith(
            fontSize: 15,
            color: Colors.black
        ),
        cursorColor: Colors.grey,
      ),
    );
  }
}