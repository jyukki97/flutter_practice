import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_movie/Model/model.dart';

class SearchFilter extends StatefulWidget {
  @override
  _SearchFilterState createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 1.0,
      maxChildSize: 1.0,
      minChildSize: 0.5,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
            color: Colors.black,
            child: Column(
              children: [
                Container(
                  height: 100,
                  margin: EdgeInsets.all(15),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 3,
                    ),
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: category.length,
                    itemBuilder: (context, index) {
                      return Listener(
                        onPointerDown: (PointerDownEvent event) {
                          setState(() {
                            category[index].selected =
                            !category[index].selected;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: category[index].selected
                                  ? Colors.red
                                  : Color(
                                  0xFF242323),
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: Text(category[index].genre,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: category[index].selected
                                    ? Colors.white
                                    : Colors.grey),),
                        ),
                      );
                    },
                  ),
                ),
              ],
            )
        );
      },
    );
  }
}