import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:striped_web/models/Post.dart';
import '../../constants.dart';
import 'components/num_list.dart';
import 'components/post_preview.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var post in samplePosts) PostPreview(post: post,),
        Expanded(
            child: NumList()
        )
      ],
    );
  }
}



