import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieInformation extends StatelessWidget {
  final movie;
  final likeFunc;
  final isLike;
  final bookMarkFunc;
  final isBookMark;

  MovieInformation({this.movie, this.likeFunc, this.isLike, this.bookMarkFunc, this.isBookMark});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: 15, vertical: 25),
            height: MediaQuery
                .of(context)
                .size
                .height * 0.6,
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movie['title'],
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '${movie['time'].toString()} | ${movie['genre']
                          .toString()} | ${movie['year'].toString()}',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey
                      ),
                    ),
                    Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment
                              .end,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,),
                            Text(movie['userRating'].toString(),
                              style: TextStyle(
                                  color: Colors.yellow
                              ),
                            )
                          ],
                        )
                    )
                  ],
                ),
                SizedBox(height: 15,),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                          child: GestureDetector(
                            onTap: () {
                              print('play');
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(50)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .center,
                                children: [
                                  Icon(Icons.play_arrow,
                                    color: Colors.white,
                                    size: 30,),
                                  SizedBox(width: 10,),
                                  Text('Watch Movie',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight
                                            .bold
                                    ),)
                                ],
                              ),
                            ),
                          )
                      ),
                      SizedBox(width: 15,),
                      GestureDetector(
                        onTap: () {
                          likeFunc();
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: isLike
                              ? Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 30)
                              : Icon(
                              Icons.favorite_border,
                              color: Colors.red, size: 30),
                        ),
                      ),
                      SizedBox(width: 15,),
                      GestureDetector(
                          onTap: () {
                            bookMarkFunc();
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: isBookMark
                                ? Icon(
                                Icons.bookmark,
                                color: Colors.red,
                                size: 30)
                                : Icon(
                                Icons.bookmark_border,
                                color: Colors.red,
                                size: 30),
                          )
                      )
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start,
                        children: [
                          Text('줄거리',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            movie['summary'].toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            height: 280,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('감독/출연',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Expanded(
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: movie['actList'].length,
                                        itemBuilder: (context, index) {
                                          var role = movie['actList'][index]['role'] == null
                                              ? ''
                                              : movie['actList'][index]['role'];
                                          return Container(
                                              margin: EdgeInsets.only(
                                                  right: 10),
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width / 3 - 20,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    child: Image.network(movie['actList'][index]['actImg']),
                                                  ),
                                                  SizedBox(height: 5,),
                                                  Container(
                                                    child: Text(
                                                        movie['actList'][index]['actName'],
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 17,
                                                        fontWeight: FontWeight.bold
                                                      ),
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.symmetric(vertical: 5),
                                                        padding: EdgeInsets.symmetric(horizontal: 5),
                                                        decoration: BoxDecoration(
                                                          border: Border(
                                                            right: BorderSide(
                                                                width: 1.0,
                                                                color: Colors
                                                                    .grey),
                                                          ),
                                                        ),
                                                        child: Text(movie['actList'][index]['roleName'],
                                                            style: TextStyle(
                                                                color: Colors.red,
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 15
                                                            )
                                                        ),
                                                      ),
                                                      Expanded(
                                                          child: Container(
                                                            padding: EdgeInsets.all(5),
                                                            child: Text(
                                                                role,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white
                                                                ),
                                                              maxLines: 2,
                                                              overflow: TextOverflow.ellipsis,
                                                            ),
                                                          )

                                                      )
                                                    ],
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                  )
                                                ],
                                              )
                                          );
                                        }
                                    )
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                )
              ],
            )
        )
    );
  }
}