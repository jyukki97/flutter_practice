import 'package:flutter/material.dart';

import '../../../constants.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: defaultPadding,),
        Text("© Untitled.\nDesign: Flutter\nDemo Images: Unsplash",
          style: Theme.of(context).textTheme.bodyText1.copyWith(
              color: Colors.grey,
              fontSize: 15,
              height: 2
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: defaultPadding,),
      ],
    );
  }
}