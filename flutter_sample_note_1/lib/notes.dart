import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'model/task_model.dart';

class Notes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 10),
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            color: Color(0x6066bfbf),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
            cursorColor: Colors.white,
            decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                hintText: 'Search Notes',
                hintStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),
                prefixIcon: Icon(Icons.search_rounded, color: Colors.white,)
            ),
          ),
        ),
        Expanded(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                itemCount: Tasks.length,
                itemBuilder: (BuildContext context, int index) {
                  String title = Tasks[index].title;
                  String contents = Tasks[index].contents;
                  List<String> images = Tasks[index].images;
                  List<String> dates = Tasks[index].dates;
                  String overflow;
                  if(contents.length > 100){
                    overflow = contents.substring(0, 100) + '...';
                  }
                  return Container(
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          images == null
                              ? SizedBox()
                              : SizedBox(
                            child: Image.asset("assets/images/${images[0]}"),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              title,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),
                              maxLines: 1,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              overflow == null
                                  ? contents
                                  : overflow,
                            style: TextStyle(
                              fontSize: 15
                            ),
                            )
                          ),
                          Container(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Icon(Icons.calendar_today, size: 13,),
                                  SizedBox(width: 5,),
                                  Text(
                                    '${dates[0]} ${dates[1]}, ${dates[2]}',
                                    style: TextStyle(
                                      fontSize: 13
                                    ),
                                  )
                                ],
                              )
                          ),
                        ],
                      )
                  );
                },
                staggeredTileBuilder: (int index) =>
                new StaggeredTile.fit(2),
                mainAxisSpacing: 15.0,
                crossAxisSpacing: 15.0,
              ),
            )
        )
      ],
    );
  }
}