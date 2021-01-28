import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_bookstore/model/book_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'circle_tab_indicator.dart';
import 'grid_tab.dart';

class Bookstore extends StatefulWidget {
  @override
  _BookstoreState createState() => _BookstoreState();
}

class _BookstoreState extends State<Bookstore> {

  final controller = PageController(viewportFraction: 1);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 16),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 100,
                child: PageView(
                  controller: controller,
                  children: List.generate(
                    6,
                        (_) =>
                        Container(
                          height: 280,
                          margin: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/banner.jpg"),
                                  fit: BoxFit.fill
                              ),
                              borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Container(
                child: SmoothPageIndicator(
                  controller: controller,
                  count: 6,
                  effect: ExpandingDotsEffect(
                      dotWidth: 7,
                      dotHeight: 7,
                      expansionFactor: 4,
                      activeDotColor: Color(0xFF66bfbf)
                  ),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
        Expanded(
          child: DefaultTabController(
              length: 3,
              child: Column(
                children: <Widget>[
                  Material(
                    color: Color(0xFFF3F3F3),
                    child: TabBar(
                      unselectedLabelColor: Colors.grey,
                      labelColor: Color(0xFF66bfbf),
                      indicatorColor: Colors.transparent,
                      indicator: CircleTabIndicator(
                          color: Color(0xFF66bfbf), radius: 4),
                      unselectedLabelStyle: TextStyle(
                          fontSize: 20
                      ),
                      labelStyle: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                      ),
                      isScrollable: true,
                      tabs: [
                        Text('For You',),
                        Text('Best Sellers',),
                        Text('Categories',),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Expanded(
                    child: TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        GridTab(booklst: booklist,),
                        GridTab(booklst: booklist,),
                        GridTab(booklst: booklist,),
                      ],
                    ),
                  ),
                ],
              )
          ),
        )
      ],
    );
  }
}