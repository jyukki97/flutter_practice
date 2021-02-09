import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_movie/Model/model.dart';
import 'package:flutter_sample_movie/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'Movie/movie_page.dart';
import 'movie_widget.dart';

class MovieScreen extends StatefulWidget {
  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  Future fetch() async {
    var movieURL = ['https://movie.naver.com/movie/running/current.nhn', 'https://movie.naver.com/movie/running/premovie.nhn?order=reserve'];
    List<List<Map<String, dynamic>>> list = [];
    for(var URL in movieURL){
      http.Response response = await http.get(URL);
      dom.Document document = parser.parse(response.body);
      var keywordElements = document.querySelectorAll('.lst_wrap .lst_detail_t1 li');

      List<Map<String, dynamic>> keywords = [];
      for(var i in keywordElements) {
        var url = i.querySelector('a').attributes['href'];
        var img = i.querySelector('img').attributes['src'].toString().split('?')[0];
        var name = i.querySelector('img').attributes['alt'];
        keywords.add({
          'url': url,
          'thumb': img,
          'title': name
        });
      }
      list.add(keywords);
    }

    return list;
  }

  refresh(){
    setState(() {

    });
  }

  final controller = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            Expanded(
              flex: 3,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: FutureBuilder(
                      future: fetch(),
                      builder: (context, snap) {
                        if (!snap.hasData)
                          return Center(child: CircularProgressIndicator());
                        List result = snap.data[selected];
                        return PageView(
                            controller: controller,
                            children: List.generate(
                              result.length, (index) =>
                                GestureDetector(
                                    onTap: () async {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => MoviePage(movie: result[index],)),
                                      );
                                      setState(() {});
                                    },
                                    child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          width: MediaQuery.of(context).size.width,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(15),
                                            child: Image.network(
                                              result[index]['thumb']
                                                  .toString(), fit: BoxFit.fill,),
                                          ),
                                        ),
                                ),
                            )
                        );
                      }
                  ),
                ),
            ),
            Expanded(
              flex: 2,
              child: MovieWidget(title: '저장한 영화', list: bookMark, setFunction: refresh,)
            ),
          ],
    );
  }
}