import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_movie/Model/model.dart';
import 'package:flutter_sample_movie/Search/search_filter.dart';
import 'package:flutter_sample_movie/Search/search_list.dart';
import 'package:http/http.dart' as http;

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreen createState() => _SearchScreen();
}
class _SearchScreen extends State<SearchScreen> {
  var _controller = TextEditingController();
  String _query = '';

  Future fetch({String query, int genre, int display, int start}) async {
    String queryGenre = '';
    if (genre != 0) {
      queryGenre = 'genre=$genre';
    }
    var res = await http.get(
        "https://openapi.naver.com/v1/search/movie.json?query=$query&display=$display&start=$start&$queryGenre",
        headers: {
          "X-Naver-Client-Id": "VvCqxfvxZpqKFYkCfUTL",
          "X-Naver-Client-Secret": "J_Zb8odkNl"
        }
    );

    return json.decode(res.body);
  }

  @override
  Widget build(BuildContext context) {
    var _searchList = SearchList(query: _query, fetch: fetch);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Search', style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold
          ),
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.filter_list_rounded, color: Colors.white,),
                onPressed: () {
                  showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (c) {
                        return SearchFilter();
                      }
                  );
                }
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      TextField(
                        onSubmitted: (text) {
                          setState(() {
                            _query = text;
                            searched.remove(_query);
                            searched.add(_query);
                            _searchList.result.clear();
                          });
                        },
                        autofocus: false,
                        controller: _controller,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            prefixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _query = _controller.text;
                                  searched.remove(_query);
                                  searched.add(_query);
                                  _searchList.result.clear();
                                });
                              },
                              icon: Icon(
                                Icons.search_rounded, color: Colors.red,),
                            ),
                            hintText: 'Search Movie',
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 20
                            )
                        ),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.clear, color: Colors.red,),
                        onPressed: () {
                          setState(() {
                            _controller.clear();
                            _query = '';
                          });
                        },
                      )
                    ],
                  )
              ),
              SizedBox(height: 15,),
              _query != ''
                  ? _searchList
                  : Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('검색 기록',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),
                            ),
                            Expanded(
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          searched.clear();
                                        });
                                      },
                                      child: Text('CLEAR ALL',
                                        style: TextStyle(
                                            fontWeight: FontWeight
                                                .bold,
                                            color: Colors.red
                                        ),
                                      ),
                                    )
                                )
                            )
                          ],
                        ),
                        Expanded(
                            child: ListView.builder(
                                itemCount: searched.length,
                                itemBuilder: (context, index) {
                                  var _searchText = searched.elementAt(searched.length - index - 1);
                                  return Container(
                                    margin: EdgeInsets.only(top: 10),
                                    height: 30,
                                    child: Row(
                                        children: [
                                          Icon(Icons.search_rounded,
                                            color: Colors.red,),
                                          SizedBox(width: 15,),
                                          Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    _controller.text = _searchText;
                                                    _query = _searchText;
                                                    searched.remove(_query);
                                                    searched.add(_query);
                                                  });
                                                },
                                                child: Text(
                                                  _searchText,
                                                  overflow: TextOverflow
                                                      .ellipsis,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight
                                                          .bold,
                                                      color: Colors.white
                                                  ),
                                                ),
                                              )
                                          ),
                                          SizedBox(width: 15,),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                searched.remove(_searchText);
                                              });
                                            },
                                            child: Text('x',
                                              style: TextStyle(
                                                  color: Colors.grey),),
                                          )
                                        ]
                                    ),
                                  );
                                }
                            )
                        )
                      ],
                    ),
                  )
              )
            ],
          ),
        )
    );
  }
}