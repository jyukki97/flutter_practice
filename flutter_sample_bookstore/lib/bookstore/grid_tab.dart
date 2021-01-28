import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_bookstore/model/book_model.dart';

class GridTab extends StatelessWidget {
  List<Book> booklst;

  GridTab({this.booklst});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 15.0,
          childAspectRatio: 0.45
        ),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          String image = booklst[index].image;
          String name = booklst[index].name;
          String author = booklst[index].author;
          int grade = booklst[index].grade;
          List<Widget> star = [];

          for (var i = 0; i < 5; i++) {
            if (grade > i) {
              star.add(Icon(Icons.star, size: 10, color: Color(0xFF66bfbf),));
            }
            else {
              star.add(Icon(Icons.star, size: 10, color: Colors.grey,));
            }
          }
          return Container(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset("assets/images/$image", fit: BoxFit.fill,),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    author,
                    style: TextStyle(
                        fontSize: 10
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  alignment: Alignment.center,
                  child: Row(
                      children: star
                  ),
                )
              ],
            ),
          );
        }
      ),
    );
  }

}