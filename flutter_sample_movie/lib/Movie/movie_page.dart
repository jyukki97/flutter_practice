import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_movie/Model/model.dart';
import 'package:flutter_sample_movie/Movie/movie_information.dart';
import 'package:flutter_sample_movie/Movie/trailer_view.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;

class MoviePage extends StatefulWidget {
  final movie;

  MoviePage({this.movie});

  @override
  _MoviePage createState() => _MoviePage();
}

class _MoviePage extends State<MoviePage> {
  bool _like = false;
  bool _bookMark = false;

  Future fetch() async {
    http.Response response = await http.get(
        'https://movie.naver.com${widget.movie['url'].toString()}');
    dom.Document document = parser.parse(response.body);
    var keywordElements = document.querySelectorAll('.poster img');
    widget.movie['thumb'] = keywordElements[0].attributes['src'].toString().split('?')[0];
    keywordElements = document.querySelectorAll('.info_spec span');
    widget.movie['genre'] = keywordElements[0].querySelector('a').text;
    widget.movie['time'] = keywordElements[2].text;
    widget.movie['year'] = keywordElements[3].querySelector('a').text;
    List<Map<String, dynamic>> actList = [];
    keywordElements = document.querySelectorAll('.people li');
    for(var i in keywordElements) {
      var img = i.querySelector('img');
      var staff = i.querySelector('.staff');
      actList.add({
        'actImg': img.attributes['src'],
        'actName': img.attributes['alt'],
        'roleName': staff
            .querySelector('dt')
            .text,
        if(staff.children.length > 1)
          'role': staff.querySelector('dd').text,
      }
      );
    }
    widget.movie['actList'] = actList;

    if(widget.movie['userRating'] == null){
      keywordElements = document.querySelectorAll('.main_score .ntz_score .star_score em');
      if(keywordElements.isNotEmpty) {
        String userRating = '';
        for (var i in keywordElements) {
          userRating += i.text.toString();
        }
        widget.movie['userRating'] = double.parse(userRating.substring(4));
      }
      else{
        widget.movie['userRating'] = 0.0;
      }
    }

    keywordElements = document.querySelectorAll('.story_area .con_tx');
    widget.movie['summary'] = keywordElements[0].text;

    keywordElements = document.querySelectorAll('.video_thumb .video_obj');
    String url;
    for (var element in keywordElements) {
      if(element.attributes['title'].toString() == '메인 예고편'){
        url = element.attributes['href'];
      }else if(url == null && element.attributes['title'].toString() == '티저 예고편'){
        url = element.attributes['href'];
      }
    }
    if(url == null){
      url = keywordElements[0].attributes['href'];
    }

    response = await http.get('https://movie.naver.com$url');
    document = parser.parse(response.body);
    keywordElements = document.querySelectorAll('._videoPlayer');
    widget.movie['trailer'] = 'https://movie.naver.com${keywordElements[0].attributes['src'].toString()}';

    _like = likeMovie.containsKey(widget.movie['url'].toString());
    _bookMark = bookMark.containsKey(widget.movie['url'].toString());
  }

  setLike(){
    setState(() {
      if (_like) {
        _like = false;
        likeMovie.remove(
            widget.movie['url']
                .toString());
      }
      else {
        _like = true;
        likeMovie[widget.movie['url']
            .toString()] =
            widget.movie;
      }
    });
  }

  setBookMark(){
    setState(() {
      if (_bookMark) {
        _bookMark = false;
        bookMark.remove(
            widget.movie['url']
                .toString());
      }
      else {
        _bookMark = true;
        bookMark[widget.movie['url']
            .toString()] =
            widget.movie;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: FutureBuilder(
            future: fetch(),
            builder: (context, snap) {
              if (widget.movie['summary'] == null)
                return Center(child: CircularProgressIndicator());
              return Stack(
                children: [
                  Container(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.only(top: MediaQuery
                          .of(context)
                          .padding
                          .top),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: Image.network(
                        widget.movie['thumb'].toString(),
                        fit: BoxFit.fill,)
                  ),
                  Container(
                    padding: EdgeInsets.only(top: MediaQuery
                        .of(context)
                        .padding
                        .top),
                    height: MediaQuery
                        .of(context)
                        .size
                        .height,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        gradient: LinearGradient(
                            begin: FractionalOffset.topCenter,
                            end: FractionalOffset.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black,
                            ],
                            stops: [
                              0.0,
                              0.55
                            ]
                        )
                    ),
                  ),
                  MovieInformation(
                    movie: widget.movie,
                    likeFunc: setLike, isLike: _like,
                    bookMarkFunc: setBookMark, isBookMark: _bookMark,
                  ),
                  Positioned(
                      child: Container(
                        padding: EdgeInsets.only(top: MediaQuery
                            .of(context)
                            .padding
                            .top),
                        height: 56,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        decoration: BoxDecoration(
                            color: Colors.transparent
                        ),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconButton(
                                  icon: Icon(Icons.arrow_back_ios_outlined,
                                    color: Colors.white,),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  }
                              ),
                              SizedBox(width: 10,),
                              Text(
                                widget.movie['title'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              )
                            ]
                        ),
                      )
                  ),
                  Positioned(
                      left: 0,
                      right: 0,
                      top: MediaQuery
                          .of(context)
                          .size
                          .height * 0.2,
                      child: widget.movie['trailer'] == null
                          ? SizedBox()
                          : IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>
                                    TrailerView(url: widget.movie['trailer'],),)
                            );
                          },
                          icon: Icon(
                            Icons.play_circle_outline, color: Colors.white,
                            size: 100,)
                      )
                  )
                ],
              );
            }
        )
    );
  }
}