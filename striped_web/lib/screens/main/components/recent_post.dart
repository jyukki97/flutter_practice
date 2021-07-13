import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'divider_with_shadow.dart';

class RecentPost extends StatelessWidget {
  const RecentPost({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Recent Posts",
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.white
            ),
          ),
          SizedBox(height: defaultPadding/2,),
          PostButton(title: "Lorem ipsum dolor",),
          DividerWithShadow(),
          PostButton(title: "Feugiat nisl aliquam",),
          DividerWithShadow(),
          PostButton(title: "Sed dolore magna",),
          DividerWithShadow(),
          PostButton(title: "Malesuada commodo",),
          DividerWithShadow(),
          PostButton(title: "Ipsum metus nullam",),
        ],
      ),
    );
  }
}

class PostButton extends StatelessWidget {
  const PostButton({
    Key key,
    @required this.title
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: defaultPadding/2),
      child: TextButton(
          onPressed: () {},
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyText1.copyWith(
              fontSize: 15,
              color: Colors.white.withOpacity(0.8),
              decoration: TextDecoration.underline,
            ),
          )
      ),
    );
  }
}