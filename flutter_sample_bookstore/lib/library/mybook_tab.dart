import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_bookstore/model/book_model.dart';

class Mybook extends StatelessWidget {
  List<Book> mybooklst;

  Mybook({this.mybooklst});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: mybooklst.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == mybooklst.length) {
            return Column(
              children: [
                Container(
                  height: 150,
                  width: 150,
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: Radius.circular(12),
                    padding: EdgeInsets.all(6),
                    dashPattern: [5, 1],
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add, color: Colors.grey,
                            size: 35,),
                          Text('책 추가', style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.grey
                          ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(child: Text('')),
              ],
            );
          }
          else {
            String image = mybooklst[index].image;
            String name = mybooklst[index].name;
            double page = mybooklst[index].page;

            return Container(
              width: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 130,
                    height: 150,
                    child: Image.asset(
                      "assets/images/$image", fit: BoxFit.fill,),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: Text(
                      name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 100,
                            height: 5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    100),
                                color: Colors.grey
                            ),
                          ),
                          Container(
                            width: page,
                            height: 5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    100),
                                color: Colors.orangeAccent
                            ),
                          )
                        ],
                      ),
                      Container(
                          width: 30,
                          alignment: Alignment.centerRight,
                          child: Text(
                            '${(page).toStringAsFixed(0)}%',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold
                            ),
                          )
                      )
                    ],
                  )
                ],
              ),
            );
          }
        }
    );
  }
}