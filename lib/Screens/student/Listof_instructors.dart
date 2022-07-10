import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:illuminate/networks/get_data/Get_all_profiles.dart';
import 'package:illuminate/providers/Shared_pref.dart';
import 'package:illuminate/widgets/drawer.dart';
import 'package:provider/provider.dart';
import '../../networks/get_data/Send_req.dart';
import '../../refrence.dart';
class Instructor_list extends StatefulWidget {
  static const scid="list_ins";
  const Instructor_list({Key? key}) : super(key: key);


  @override
  State<Instructor_list> createState() => _Instructor_listState();
}

class _Instructor_listState extends State<Instructor_list> {

  // Build animated item (helper for all examples)
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
  final sc=PageController(initialPage: 0,viewportFraction: 1);
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    var height=size.height;
    var width=size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,

        key: scaffoldKey,
        endDrawer: const Mydrawer(),
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            // Status bar color
            statusBarColor: Colors.white,

            // Status bar brightness (optional)
            statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
            statusBarBrightness: Brightness.light, // For iOS (dark icons)
          ),

          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
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
          actions: <Widget>[
            IconButton(
              icon: Container(
                  height: height/25,
                  width: width/12,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).backgroundColor
                  ),
                  child: const Icon(Icons.settings)),
              tooltip: 'Setting Icon',
              color: const Color.fromRGBO(204, 88, 76, 1),
              onPressed: () {},
            ), //Ic// onButton
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
              onPressed:() => scaffoldKey.currentState!.openEndDrawer(),
            ), //Ic

          ], //<Widget>[]
        ),

        body:FutureBuilder(
          future:Provider.of<Prov_get_all_profiles>(context).getdistance(20,20),
          builder: (context,snapshot)=>snapshot.connectionState==ConnectionState.waiting?const Center(child: CircularProgressIndicator(),):AnimationLimiter(
            child: ListView.builder(
              controller: sc,

              itemCount: Provider.of<Prov_get_all_profiles>(context).instructor_orderd.length,
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
                                                    image: NetworkImage(


                                                        'http://mohamedelbadry.me/illuminate/${Provider.of<Prov_get_all_profiles>(context).instructor_orderd[index].profile!.image}'),
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
                                          Text(Provider.of<Prov_get_all_profiles>(context).instructor_orderd[index].profile!.college.toString())

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
                                          Text('الاسم: ${Provider.of<Prov_get_all_profiles>(context).instructor_orderd[index].profile!.name}', textAlign: TextAlign.right,
                                            textDirection: TextDirection.rtl,
                                            style: TextStyle(
                                                fontSize: width/32
                                            ),
                                          ),
                                          Text(' العمر: ${Provider.of<Prov_get_all_profiles>(context).instructor_orderd[index].profile!.age}', textAlign: TextAlign.right,
                                            textDirection: TextDirection.rtl,
                                            style: TextStyle(
                                                fontSize: width/32
                                            ),
                                          ),
                                          Text(' الموقع: ${Provider.of<Prov_get_all_profiles>(context).instructor_orderd[index].profile!.address}', textAlign: TextAlign.right,
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
                                  onTap: (){
                                    Provider.of<Prov_send_req>(context,listen:false ).send_request(1.toString());
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
          ),
        ),

      ),
    );
  }
}
