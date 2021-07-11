import 'package:flutter/material.dart';
import 'package:portfolio_blog/components/animated_progress_indicator.dart';
import '../../../constants.dart';

class Coding extends StatelessWidget {
  const Coding({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(),
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Text(
            "Coding",
            style: Theme
                .of(context)
                .textTheme
                .subtitle2,
          ),
        ),
        AnimatedLinearProgressIndicator(
          percentage: 0.7,
          label: "Dart",
        ),
        AnimatedLinearProgressIndicator(
          percentage: 0.68,
          label: "Python",
        ),
        AnimatedLinearProgressIndicator(
          percentage: 0.9,
          label: "C++",
        ),
        AnimatedLinearProgressIndicator(
          percentage: 0.75,
          label: "C#",
        ),
        AnimatedLinearProgressIndicator(
          percentage: 0.58,
          label: "HTML",
        ),
      ],
    );
  }
}