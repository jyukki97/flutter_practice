import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_movie/movie_screen.dart';
import 'package:flutter_sample_movie/slidedown_route.dart';

import 'Search/search_screen.dart';

_HomeScreenState hsState = new _HomeScreenState();
int selected = 0;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => hsState;
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      selected = 0;
                      print('현재 상영작');
                    });
                  },
                  child: Center(
                    child: Text(
                      '현재 상영작',
                      style: TextStyle(
                          color: selected == 0 ? Colors.white : Colors.grey,
                          fontWeight: selected == 0 ? FontWeight.bold : FontWeight.normal
                      ),
                    ),
                  )
                )
            ),
            Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      selected = 1;
                      print('개봉예정');
                    });
                  },
                  child: Center(
                    child: Text(
                      '개봉예정',
                      style: TextStyle(
                          color: selected == 1 ? Colors.white : Colors.grey,
                          fontWeight: selected == 1 ? FontWeight.bold : FontWeight.normal
                      ),
                    ),
                  )
                )
            )
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.play_circle_fill, color: Colors.red,),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search_rounded, color: Colors.red,),
            onPressed: () async {
              await Navigator.push(
                  context, SlideDownRoute(page: SearchScreen()));
              setState(() {});
            },
          )
        ],
      ),
      body: MovieScreen(),
    );
  }
}


