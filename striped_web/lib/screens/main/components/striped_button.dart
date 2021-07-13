import 'package:flutter/material.dart';

import '../../../constants.dart';

class StripedButton extends StatelessWidget {
  const StripedButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Center(
        child: GestureDetector(
          onTap: (){
            print("click");
          },
          child: Container(
            height: 100,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.all(Radius.circular(5)),
                border: Border.all(
                    color: Colors.grey.withOpacity(0.3),
                    width: 1
                )
            ),
            child: Text(
              "STRIPED",
              style: Theme.of(context).textTheme.button.copyWith(
                  fontSize: 30
              ),
            ),
          ),
        ),
      ),
    );
  }
}