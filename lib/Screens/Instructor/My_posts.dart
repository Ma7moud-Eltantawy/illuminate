import 'package:flutter/material.dart';
import 'package:illuminate/networks/get_data/get_posts.dart';
import 'package:illuminate/networks/models/post_model.dart';
import 'package:illuminate/providers/Shared_pref.dart';
import 'package:provider/provider.dart';

import '../../widgets/Post_widget.dart';
class My_post extends StatefulWidget {
  List <post_model> Posts;
  My_post({Key? key,required this.Posts}) : super(key: key);

  @override
  State<My_post> createState() => _My_postState();
}

class _My_postState extends State<My_post> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: post_widget(
      Posts_list: widget.Posts,

    ));
  }
}
