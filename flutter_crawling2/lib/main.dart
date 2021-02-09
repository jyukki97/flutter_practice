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
    http.Response response = await http.get('https://movie.naver.com/movie/running/current.nhn');
    dom.Document document = parser.parse(response.body);
    var keywordElements = document.querySelectorAll('.lst_detail_t1 li');
    print(keywordElements.length);
    List<Map<String, dynamic>> keywords = [];
    for (var element in keywordElements) {
      var img = element.querySelector('img');
      var link = element.querySelector('.tit').querySelector('a');
      var rank = element.querySelector('.num');
      keywords.add({
        'img' : img.attributes['src'],
        'rank': rank.text,
        'title': link.text,
        'url': link.attributes['href']
      });
    }
    print(keywords);

    return keywords;
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
                  leading: Image.network(result[index]['img'].toString()),
                  title: Text('${result[index]['title'].toString()}  ${result[index]['rank'].toString()}'),
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
