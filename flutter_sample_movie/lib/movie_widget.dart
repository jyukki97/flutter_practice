import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Movie/movie_page.dart';

class MovieWidget extends StatelessWidget {
  final title;
  final list;
  final setFunction;

  MovieWidget({this.title, this.list, this.setFunction});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15, left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 15,),
          Expanded(
              child: list.length == 0
                  ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.announcement_outlined, color: Colors.white, size: 50,),
                      Text('$title가 없습니다.',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          )
                      )
                    ],
                  )
              )
                  : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    var _movie = list.entries
                        .elementAt(index)
                        .value;
                    return GestureDetector(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MoviePage(movie: _movie,)),
                        );
                        setFunction();
                      },
                      child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 4 - 25,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Image.network(_movie['thumb']),
                              ),
                              Container(
                                child: Text(
                                  _movie['title'],
                                  style: TextStyle(color: Colors.white),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                padding: EdgeInsets.all(5),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5),
                                child: Text(
                                  _movie['genre'],
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          )
                      ),
                    );
                  }
              )
          )
        ],
      ),
    );
  }
}