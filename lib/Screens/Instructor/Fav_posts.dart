import 'package:flutter/material.dart';
import 'package:illuminate/Screens/Instructor/My_posts.dart';
import 'package:provider/provider.dart';

import '../../networks/get_data/get_posts.dart';
import '../../providers/Shared_pref.dart';

class Fav_List_Screen extends StatefulWidget {
  const Fav_List_Screen({Key? key}) : super(key: key);

  @override
  State<Fav_List_Screen> createState() => _Fav_List_ScreenState();
}

class _Fav_List_ScreenState extends State<Fav_List_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body:  SingleChildScrollView(
        child:  My_post(
          Posts: Provider.of<Prov_get_posts>(context,listen: false).Likes_posts(Provider.of<Prov_Shared_Pref>(context,listen:false).teach_prof_data!.data!.profile!.id!.toInt()),
        ),
      ),
    );
  }
}
