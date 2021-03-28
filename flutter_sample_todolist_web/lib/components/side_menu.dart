import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  SideMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black
      ),
      child: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.greenAccent
              ),
              child: IconButton(
                  icon: Icon(Icons.menu, color: Colors.white,),
                  onPressed: (){

                  }
              ),
            ),
            IconButton(
                icon: Icon(Icons.menu, color: Colors.grey,),
                onPressed: (){

                }
            ),
            IconButton(
                icon: Icon(Icons.menu, color: Colors.grey,),
                onPressed: (){

                }
            ),
            IconButton(
                icon: Icon(Icons.menu, color: Colors.grey,),
                onPressed: (){

                }
            ),
            IconButton(
                icon: Icon(Icons.menu, color: Colors.grey,),
                onPressed: (){

                }
            )
          ],
        )
      )
    );
  }


}