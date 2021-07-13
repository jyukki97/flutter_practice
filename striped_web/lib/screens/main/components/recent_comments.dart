import 'package:flutter/material.dart';
import 'package:striped_web/screens/main/components/recent_post.dart';

import '../../../constants.dart';
import 'divider_with_shadow.dart';

class RecentComments extends StatelessWidget {
  const RecentComments({
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
          Text("Recent Comments",
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.white
            ),
          ),
          SizedBox(height: defaultPadding/2,),
          CommentBtn(
            comment: "Lorem ipsum dolor",
            user: "case",
          ),
          DividerWithShadow(),
          CommentBtn(
            comment: "Sed dolore magna",
            user: "molly",
          ),
          DividerWithShadow(),
          CommentBtn(
            comment: "Sed dolore magna",
            user: "case",
          ),
        ],
      ),
    );
  }
}

class CommentBtn extends StatelessWidget {
  const CommentBtn({
    Key key,
    @required this.comment,
    @required this.user
  }) : super(key: key);

  final String user;
  final String comment;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("$user on ",
          style: Theme
              .of(context)
              .textTheme
              .bodyText1
              .copyWith(
              color: Colors.grey
          ),
        ),
        PostButton(title: comment,),
      ],
    );
  }
}

