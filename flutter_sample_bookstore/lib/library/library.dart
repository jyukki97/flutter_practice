import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_bookstore/library/mybook_tab.dart';
import 'package:flutter_sample_bookstore/library/wishlist_tab.dart';
import 'package:flutter_sample_bookstore/model/book_model.dart';

class Library extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(bottom: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'My Book',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                    ),
                  )
              ),
              Container(
                  height: 220.0,
                  child: Mybook(mybooklst: mybook,)
              ),
            ],
          ),
        ),
        SizedBox(height: 10,),
        Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Wishlist',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                        child: Wishlist(wishlst: wishlist,)
                      )
                  ),
                ],
              ),
            )
        )
      ],
    );
  }
}