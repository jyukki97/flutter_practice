import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_bookstore/model/book_model.dart';

class Wishlist extends StatelessWidget {
  List<Book> wishlst;

  Wishlist({this.wishlst});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
            childAspectRatio: 1.5
        ),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: wishlist.length,
        itemBuilder: (BuildContext context, int index) {
          String image = wishlst[index].image;
          String name = wishlst[index].name;
          String author = wishlst[index].author;
          int grade = wishlst[index].grade;
          List<Widget> star = [];

          for (var i = 0; i < 5; i++) {
            if (grade > i) {
              star.add(Icon(Icons.star, size: 10,
                color: Color(0xFF66bfbf),));
            }
            else {
              star.add(Icon(Icons.star, size: 10, color: Colors.grey,));
            }
          }

          return Container(
              child: Row(
                children: [
                  Container(
                    width: 80,
                    child: Image.asset(
                      "assets/images/$image",
                      fit: BoxFit.fill,),
                  ),
                  Expanded(
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment
                                .start,
                            children: [
                              Text(
                                name,
                                style: TextStyle(
                                    fontWeight: FontWeight
                                        .bold,
                                    fontSize: 15
                                ),
                              ),
                              Text(
                                author,
                                style: TextStyle(
                                    fontSize: 10
                                ),
                              ),
                              Expanded(child: Text('')),
                              Row(
                                children: star,
                              )
                            ],
                          )
                      )
                  )
                ],
              )
          );
        }
    );
  }

}