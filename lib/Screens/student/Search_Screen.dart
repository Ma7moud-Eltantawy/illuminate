
import 'package:flutter/material.dart';
import 'package:illuminate/networks/Api.dart';
import 'package:illuminate/widgets/drawer.dart';

import '../../networks/network.dart';
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
          color: Color.fromRGBO(204, 88, 76, 1),
        ),
        leading: Container(
          margin: EdgeInsets.only(left: width/60),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color:Color.fromRGBO(204, 88, 76, 1),
                    shape: BoxShape.circle
                ),
                height: height/10,
                width: width/10.3,

              ),
              Container(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/img/tantawy.jpg'),
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
                child: Icon(Icons.search)),
            tooltip: 'Setting Icon',
            color: Color.fromRGBO(204, 88, 76, 1),
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
                child: Icon(Icons.menu)),
            tooltip: 'Setting Icon',
            color: Color.fromRGBO(204, 88, 76, 1),
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
                      Text("اضغط على",textAlign: TextAlign.center,),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: width/20),
                          child: Icon(Icons.search)),
                      Text("لكى تتمكن من البحث",textAlign: TextAlign.center,),

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
      endDrawer: Mydrawer(),
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
        icon: Icon(Icons.clear),
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
    return Container(
      height: 150.0,
      child: Card(
        color: Colors.red,
        shape: StadiumBorder(),
        child: Text(query),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final suggestionList = query.isEmpty
        ? recentlist
        : statelist.where((element) => element.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
          onTap: () {
            showResults(context);
          },
          title: RichText(
            text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                      text: suggestionList[index].substring(query.length),
                      style: TextStyle(color: Colors.grey))
                ]),
          )),
      itemCount: suggestionList.length,
    );
  }
}