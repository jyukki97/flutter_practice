import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider/chat/recent_chats.dart';
import 'favorite_contents.dart';

class ChatMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: Container(
              height: 200.0,
              decoration: BoxDecoration(
                  color: Theme
                      .of(context)
                      .accentColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)
                  )
              ),
              child: Column(
                children: <Widget>[
                  //FavoriteContacts(),
                  RecentChats()
                ],
              ),
            )
        )
      ],
    );
  }

}