
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:illuminate/networks/get_data/Get_all_profiles.dart';
import 'package:illuminate/providers/Shared_pref.dart';
import 'package:illuminate/widgets/drawer.dart';
import 'package:provider/provider.dart';

import '../../networks/get_data/Send_req.dart';
import '../../refrence.dart';

class Search_screen extends StatefulWidget {
  static const String scid = '/material/search';

  @override
  _Search_screenState createState() => _Search_screenState();
}

class _Search_screenState extends State<Search_screen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int ? _lastIntegerSelected;

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    var height=size.height;
    var width=size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        iconTheme: Theme.of(context).iconTheme.copyWith(
          color: const Color.fromRGBO(204, 88, 76, 1),
        ),
        leading: Container(
          margin: EdgeInsets.only(left: width/60),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                    color:Color.fromRGBO(204, 88, 76, 1),
                    shape: BoxShape.circle
                ),
                height: height/10,
                width: width/10.3,

              ),
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage('http://mohamedelbadry.me/illuminate/images/${Provider.of<Prov_Shared_Pref>(context,listen:false).stu_prof_data!.data!.profile!.image.toString().split('/').last}'),
                        fit: BoxFit.contain
                    )
                ),

                height: height/10.1,
                width: width/12.8,

              ),

            ],
          ),
        ),
        leadingWidth: width/10,
        title: const Text(''),
        actions: <Widget>[
          IconButton(
            icon: Container(
                height: height/25,
                width: width/12,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).backgroundColor
                ),
                child: const Icon(Icons.search)),
            tooltip: 'Setting Icon',
            color: const Color.fromRGBO(204, 88, 76, 1),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
          ),
          IconButton(
            icon: Container(
                height: height/25,
                width: width/12,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).backgroundColor
                ),
                child: const Icon(Icons.menu)),
            tooltip: 'Setting Icon',
            color: const Color.fromRGBO(204, 88, 76, 1),
            onPressed:() => _scaffoldKey.currentState!.openEndDrawer(),
          ), //Ic


        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
                  Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("اضغط على",textAlign: TextAlign.center,),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: width/20),
                          child: const Icon(Icons.search)),
                      const Text("لكى تتمكن من البحث",textAlign: TextAlign.center,),

                    ],
                  ),


          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).unselectedWidgetColor,
        tooltip: 'Back', // Tests depend on this label to exit the demo.
        onPressed: () {
          Navigator.of(context).pop();
        },
        label: const Text('الغاء'),
        icon: const Icon(Icons.close),
      ),
      endDrawer: const Mydrawer(),
    );
  }
}






class DataSearch extends SearchDelegate<String> {
  final statelist = [
    'Andaman and Nicobar Islands',
    '   Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chandigarh ',
    'Chhattisgarh',
    'Dadra and Nagar Havel',
    'Daman and Diu',
    'Delhi',
    'Goa',
    'Gujrat',
    'Haryana',
    'Himachal Pradesh',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal',
    'Sikkim',
    'Meghalya',
    'Mizoram',
  ];
  final recentlist = ['Modingar', 'Ghaziabad', 'Merrut', 'Hapur', 'Delhi'];

  @override
  List<Widget> buildActions(BuildContext context) {
    // action for app bar
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of the app bar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, "");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return SizedBox(
      height: 150.0,
      child: Card(
        color: Colors.red,
        shape: const StadiumBorder(),
        child: Text(query),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var size=MediaQuery.of(context).size;
    var height=size.height;
    var width=size.width;
    var scaffoldKey = GlobalKey<ScaffoldState>();
    void showsnackbar()
    {

      scaffoldKey.currentState!.showSnackBar(
          SnackBar(
              duration: const Duration(seconds: 3),
              backgroundColor: Theme.of(context).unselectedWidgetColor,
              content: const Text('تم ارسال الطلب',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'cairo'
                ),)
          )
      );

    }

    // TODO: implement buildSuggestions
    final suggestionList = query.isEmpty
        ? Provider.of<Prov_get_all_profiles>(context).instructor_orderd
        : Provider.of<Prov_get_all_profiles>(context).instructor_orderd.where((element) => element.profile!.name!.contains(query)).toList();
    return Scaffold(
      key: scaffoldKey,
      body: ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 1000),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                  child: SizedBox(
                    height: height/5,

                    child: Stack(
                      children: [

                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:BorderRadius.circular(10)
                          ),
                          elevation: 5,
                          child: Container(
                            height: height/6,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Theme.of(context).cardColor
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: width/30),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        height: height/7.7,
                                        width: width/3.80,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),

                                            color: Colors.orange[100]
                                        ),
                                      ),
                                      Container(
                                        height: height/8,
                                        width: width/4,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            image: DecorationImage(
                                                image:NetworkImage('http://mohamedelbadry.me/illuminate/images/${suggestionList[index].profile!.image!.split('/').last}'),
                                                fit: BoxFit.cover
                                            ),
                                            color: Colors.orange[100]
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: width/35),
                                  height: height/10,
                                  width: width/8,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children:  [
                                      Icon(Icons.school_outlined,color: Color.fromRGBO(204, 88, 76, 1),),
                                      Text(suggestionList[index].profile!.college.toString())

                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: width/35),
                                  height: height/8,
                                  width: width/2.5,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text('الاسم: ${suggestionList[index].profile!.name}', textAlign: TextAlign.right,
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                            fontSize: width/32
                                        ),
                                      ),
                                      Text(' العمر: ${suggestionList[index].profile!.age}', textAlign: TextAlign.right,
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                            fontSize: width/32
                                        ),
                                      ),
                                      Text(' الموقع: ${suggestionList[index].profile!.address}', textAlign: TextAlign.right,
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                            fontSize: width/32
                                        ),
                                      ),

                                    ],
                                  ),
                                )


                              ],
                            ),

                          ),
                        ),
                        Positioned(
                          bottom:height/120 ,
                          left: width/3,
                          child: GestureDetector(
                            onTap: ()async{
                              await Provider.of<Prov_send_req>(context,listen:false ).send_request(suggestionList[index].profile!.id.toString());
                              showsnackbar();

                            },
                            child: Card(
                              elevation: 3,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),topLeft: Radius.circular(15))
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  color:Color.fromRGBO(220, 75, 76, 1),
                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),topLeft: Radius.circular(15) ),
                                ),
                                height: height/28,
                                width: width/3,
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(text:"تسجيل مع المعلم",style:Theme.of(context).textTheme.bodyText1!.copyWith(
                                          fontSize: height/70,
                                          color: Colors.white,
                                          fontFamily: "cairo"
                                      ),),
                                      WidgetSpan(
                                        child: Icon(Icons.arrow_forward, size: height/65,color: Colors.white,),
                                      ),
                                    ],
                                  ),
                                ),

                              ),
                            ),
                          ),),
                      ],
                    ),
                  )
              ),
            ),
          );
        },
      ),
    );
  }
}