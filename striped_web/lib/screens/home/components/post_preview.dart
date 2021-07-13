import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:striped_web/models/Post.dart';
import 'package:striped_web/responsive.dart';

import '../../../constants.dart';

class PostPreview extends StatelessWidget {
  const PostPreview({
    Key key,
    this.post
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(Responsive.isDesktop(context))
          SideInfo(month: post.month, day: post.day,),
        Expanded(
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: Responsive.isMobile(context) ? defaultPadding : 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 90,),
                Text(
                  post.title,
                  style: Theme.of(context).textTheme.headline3.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    fontSize: Responsive.isMobile(context) ? 20 : 40
                  ),
                ),
                SizedBox(height: defaultPadding,),
                Text(
                  post.subTitle,
                  style: Theme.of(context).textTheme.headline5.copyWith(
                      color: Colors.grey,
                      letterSpacing: 0.1,
                      wordSpacing: 0.1,
                      fontSize: Responsive.isMobile(context) ? 12 : 30
                  ),
                ),
                if (Responsive.isTablet(context))
                  MobileFootInfo(month: post.month, day: post.day, year: post.year,),
                SizedBox(height: defaultPadding * 2,),
                Image.asset(post.imgName),
                SizedBox(height: defaultPadding * 2,),
                Container(
                  width: 1040,
                  child: Text(
                    post.description,
                    softWrap: true,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontSize: 15,
                        height: 1.8
                    ),
                  ),
                ),
                if(Responsive.isMobile(context))
                  Column(
                    children: [
                      SizedBox(height: 50,),
                      Divider(),
                      MobileFootInfo(month: post.month, day: post.day,),
                    ],
                  )
                else
                  SizedBox(height: 90,),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class MobileFootInfo extends StatelessWidget {
  const MobileFootInfo({
    Key key,
    @required this.month,
    @required this.day,
    this.year
  }) : super(key: key);

  final String month;
  final int day, year;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: defaultPadding,),
        Row(
            children: [
              Text("$month $day"),
              if(year != null)
                Text(", $year"),
              SizedBox(width: defaultPadding,),
              Container(
                height: 10,
                width: 1,
                color: Colors.grey,
              ),
              SizedBox(width: defaultPadding,),
              Container(
                width: 35,
                  child: IconWithNum(imageName: "assets/icons/comment.svg", num: 16,)
              ),
              SizedBox(width: defaultPadding,),
              Container(
                  width: 35,
                  child: IconWithNum(imageName: "assets/icons/heart.svg", num: 32,)
              ),
              SizedBox(width: defaultPadding,),
              Container(
                  width: 35,
                  child: IconWithNum(imageName: "assets/icons/twitter.svg", num: 64,)
              ),
              SizedBox(width: defaultPadding,),
              Container(
                  width: 35,
                  child: IconWithNum(imageName: "assets/icons/facebook.svg", num: 128,)
              )
            ],
          ),

      ],
    );
  }
}

class SideInfo extends StatelessWidget {
  const SideInfo({
    Key key,
    @required this.month,
    @required this.day
  }) : super(key: key);

  final String month;
  final int day;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      padding: EdgeInsets.all(defaultPadding),
      margin: EdgeInsets.only(
          left: defaultPadding, top: defaultPadding * 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.horizontal(
              left: Radius.circular(5)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 3,
              offset: Offset(-2, 0),
            )
          ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            month,
            style: Theme
                .of(context)
                .textTheme
                .headline6
                .copyWith(
                color: Colors.grey,
                fontWeight: FontWeight.normal
            ),
          ),
          Text(
            day.toString(),
            style: Theme
                .of(context)
                .textTheme
                .headline4
                .copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold
            ),
          ),
          Divider(),
          SizedBox(height: defaultPadding / 2,),
          IconWithNum(imageName: "assets/icons/comment.svg", num: 16,),
          SizedBox(height: defaultPadding/2,),
          IconWithNum(imageName: "assets/icons/heart.svg", num: 32,),
          SizedBox(height: defaultPadding/2,),
          IconWithNum(imageName: "assets/icons/twitter.svg", num: 64,),
          SizedBox(height: defaultPadding/2,),
          IconWithNum(imageName: "assets/icons/facebook.svg", num: 128,),
        ],
      ),
    );
  }
}

class IconWithNum extends StatelessWidget {
  const IconWithNum({
    Key key,
    @required this.imageName,
    this.num = 0
  }) : super(key: key);

  final String imageName;
  final int num;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      hoverColor: Colors.grey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(imageName, width: 16,
            height: 16,
            color: Colors.grey.withOpacity(0.3),),
          Text(
            num.toString(),
            style: Theme
                .of(context)
                .textTheme
                .bodyText1
                .copyWith(
                color: Colors.grey,
                fontSize: 11,
                fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }
}