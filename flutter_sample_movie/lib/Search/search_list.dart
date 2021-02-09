import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_movie/Movie/movie_page.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SearchList extends StatefulWidget {
  final query;
  final fetch;
  List result = [];

  SearchList({this.query, this.fetch});

  @override
  _SearchListState createState() => _SearchListState();
}
class _SearchListState extends State<SearchList> {
  RefreshController _controller = RefreshController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                color: Colors.black
            ),
            child: FutureBuilder(
                future: widget.fetch(query: widget.query, genre: 0, display: 20, start: 1),
                builder: (BuildContext context, AsyncSnapshot snap) {
                  if (!snap.hasData)
                    return Center(child: CircularProgressIndicator());
                  if(snap.data['items'].isEmpty){
                    return Center(
                      child: Text('"${widget.query}" 에 대한 검색 결과가 없습니다',
                        style: TextStyle(
                          fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      ),
                    );
                  }
                  else {
                    if (widget.result.isEmpty)
                      widget.result = snap.data['items'];
                    return SmartRefresher(
                        controller: _controller,
                        enablePullUp: true,
                        enablePullDown: false,
                        onLoading: () async {
                          if (widget.result.isNotEmpty &&
                              widget.result.length % 20 == 0) {
                            var list = await widget.fetch(query: widget.query,
                                genre: 0,
                                display: 20,
                                start: widget.result.length + 1);
                            widget.result.addAll(list['items']);
                            setState(() {});
                          }
                          _controller.loadComplete();
                        },
                        child: ListView.builder(
                          itemCount: widget.result.length,
                          itemBuilder: (context, index) {
                            Map<String, dynamic> movie = Map<String, dynamic>();
                            movie['title'] = widget.result[index]['title']
                                .toString()
                                .replaceAll('<b>', '')
                                .replaceAll('</b>', '')
                                .replaceAll('&amp;', '');
                            movie['imageURL'] =
                                widget.result[index]['image'].toString();
                            double rate = double.parse(
                                widget.result[index]['userRating'].toString());
                            movie['userRating'] = rate.toStringAsFixed(2);
                            movie['url'] =
                                widget.result[index]['link'].toString()
                                    .replaceAll('https://movie.naver.com', '');
                            List<Widget> star = [];
                            for (int i = 1; i < 6; i++) {
                              if (rate / 2 >= i) {
                                star.add(
                                  Icon(Icons.star, color: Colors.yellow,),);
                              }
                              else {
                                star.add(Icon(Icons.star_border,
                                  color: Colors.yellow,),);
                              }
                            }
                            star.add(SizedBox(width: 15,),);
                            star.add(Text(movie['userRating'],
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey
                              ),
                            )
                            );
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                      MoviePage(movie: movie,)),
                                );
                              },
                              child: Container(
                                height: 110,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                      ),
                                      child: movie['imageURL'] == ''
                                          ? SizedBox()
                                          : Image.network(
                                          widget.result[index]['image']
                                              .toString()),
                                    ),
                                    SizedBox(width: 15,),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          SizedBox(height: 10,),
                                          Container(
                                            width: MediaQuery
                                                .of(context)
                                                .size
                                                .width * 0.5,
                                            child: Text(movie['title'],
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white
                                              ),
                                              overflow: TextOverflow
                                                  .ellipsis,
                                            ),
                                          ),
                                          Expanded(
                                              child: Container(
                                                  width: MediaQuery
                                                      .of(context)
                                                      .size
                                                      .width * 0.5,
                                                  padding: EdgeInsets.only(
                                                      bottom: 10),
                                                  child: Text(
                                                    '${widget
                                                        .result[index]['director']}\t${widget
                                                        .result[index]['pubDate']
                                                        .toString()}',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.grey
                                                    ),
                                                    overflow: TextOverflow
                                                        .ellipsis,
                                                  )
                                              )
                                          ),
                                          Row(
                                              children: star
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                    );
                  }
                }
            )
        )
    );
  }
}