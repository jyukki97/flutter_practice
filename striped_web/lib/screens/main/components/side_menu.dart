import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:striped_web/constants.dart';
import 'package:striped_web/responsive.dart';
import 'package:striped_web/screens/main/components/post_title.dart';
import 'package:striped_web/screens/main/components/recent_comments.dart';
import 'package:striped_web/screens/main/components/recent_post.dart';
import 'package:striped_web/screens/main/components/side_text.dart';
import 'package:striped_web/screens/main/components/side_text_field.dart';
import 'package:striped_web/screens/main/components/striped_button.dart';
import 'custom_calender.dart';
import 'divider_with_shadow.dart';
import 'footer.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      color: primaryColor,
      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Column(
        children: [
          if(!Responsive.isMobile(context))
            Column(
              children: [
                StripedButton(),
                DividerWithShadow(),
                DividerWithShadow(),
              ],
            ),
          SizedBox(height: defaultPadding,),
          PostTitle(title: "Latest Post", isSelected: true,),
          DividerWithShadow(),
          PostTitle(title: "Archives",),
          DividerWithShadow(),
          PostTitle(title: "About Me",),
          DividerWithShadow(),
          PostTitle(title: "Contact Me",),
          SizedBox(height: defaultPadding,),
          DividerWithShadow(),
          DividerWithShadow(),
          SideTextField(),
          DividerWithShadow(),
          DividerWithShadow(),
          SideText(),
          DividerWithShadow(),
          DividerWithShadow(),
          RecentPost(),
          DividerWithShadow(),
          DividerWithShadow(),
          RecentComments(),
          DividerWithShadow(),
          DividerWithShadow(),
          CustomCalendar(),
          DividerWithShadow(),
          DividerWithShadow(),
          Footer(),
        ],
      ),
    );
  }
}







