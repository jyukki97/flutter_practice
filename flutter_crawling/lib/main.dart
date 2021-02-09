import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;

void main() => runApp(
    MaterialApp(
      home: MainPage(),
    )
);


class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DetailPage();
  }
}

class DetailPage extends StatefulWidget {

  int dataIndex;
  String query;

  DetailPage({this.dataIndex,this.query});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  Future fetch() async{
    http.Response response = await http.get('https://movie.naver.com/movie/bi/mi/basic.nhn?code=193328');
    dom.Document document = parser.parse(response.body);
    var keywordElements = document.querySelectorAll('.video_thumb .video_obj');
    String url;
    for (var element in keywordElements) {
      if(element.attributes['title'].toString() == '메인 예고편'){
        url = element.attributes['href'];
      }else if(url == null && element.attributes['title'].toString() == '티저 예고편'){
        url = element.attributes['href'];
      }
    }
    print(url);

    response = await http.get('https://movie.naver.com$url');
    document = parser.parse(response.body);
    keywordElements = document.querySelectorAll('._videoPlayer');

    print(keywordElements[0].attributes['src'].toString());

    return keywordElements;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: fetch(),
        builder: (BuildContext context, AsyncSnapshot snap){
          if(!snap.hasData) return Center(child: CircularProgressIndicator());
          List result = snap.data;
          return ListView.builder(
              itemCount: result.length,
              itemBuilder:(context, int index){
                return ListTile(
                  leading: Text(result[index]['rank'].toString()),
                  title: Text(result[index]['title'].toString()),
                  subtitle: Text(result[index]['url'].toString()),
                  trailing: Icon(Icons.chevron_right),
                );
              }
          );
        },
      ),
    );
  }
}
