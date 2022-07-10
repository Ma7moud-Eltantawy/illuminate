import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:illuminate/networks/get_data/Accept_request.dart';
import 'package:illuminate/networks/get_data/Get_pending_requests.dart';
import 'package:provider/provider.dart';

import '../networks/get_data/Send_req.dart';
import '../refrence.dart';
class Reqlist extends StatefulWidget {
  const Reqlist({Key? key}) : super(key: key);

  @override
  State<Reqlist> createState() => _ReqlistState();
}

class _ReqlistState extends State<Reqlist> {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    var height=size.height;
    var width=size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: AnimationLimiter(
        child: Consumer<Prov_Pinding_Requests>(
          builder:(context,prov,ch)=> StreamBuilder(
            stream: Provider.of<Prov_Pinding_Requests>(context).getrequests().asStream(),
            builder:(context,snapshot)=>snapshot.hasData?Center(child: CircularProgressIndicator(),):Provider.of<Prov_Pinding_Requests>(context,listen: false).requests_list.isEmpty? Center(child: CircularProgressIndicator()): ListView.builder(
              itemCount: prov.requests_list.length,
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
                                color:Theme.of(context).cardColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius:BorderRadius.circular(10)
                                ),
                                elevation: 5,
                                child: Container(
                                  height: height/6,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Theme.of(context).cardColor,
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
                                                      image: NetworkImage('http://mohamedelbadry.me/illuminate/${prov.requests_list[index].image}'),
                                                      fit: BoxFit.cover
                                                  ),
                                                  color: Colors.orange[100]
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(right: width/35,bottom: height/20,top: height/120),

                                          height: height/8,
                                          width: width/2.5,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Text('الاسم: ${prov.requests_list[index].name}', textAlign: TextAlign.right,
                                                textDirection: TextDirection.rtl,
                                                softWrap: true,
                                                maxLines: 1,
                                                style: TextStyle(
                                                    fontSize: width/32
                                                ),
                                              ),
                                              Text(' العمر: ${prov.requests_list[index].age}', textAlign: TextAlign.right,
                                                textDirection: TextDirection.rtl,
                                                style: TextStyle(
                                                    fontSize: width/32
                                                ),
                                              ),
                                              Text(' العنوان: ${prov.requests_list[index].address}', textAlign: TextAlign.right,
                                                textDirection: TextDirection.rtl,
                                                softWrap: true,
                                                maxLines: 1,
                                                style: TextStyle(
                                                    fontSize: width/32
                                                ),
                                              ),

                                            ],
                                          ),
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
                                    await Provider.of<Prov_send_req>(context,listen:false ).refuse_request(prov.requests_list[index].id.toString());

                                   // await Provider.of<Prov_Pinding_Requests>(context,listen: false).getrequests();
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
                                      width: width/4,
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(text:"رفض ",style:Theme.of(context).textTheme.bodyText1!.copyWith(
                                                fontSize: height/70,
                                                color: Colors.white,
                                                fontFamily: "cairo"
                                            ),),
                                            WidgetSpan(
                                              child: Icon(Icons.close, size: height/65,color: Colors.white,),
                                            ),
                                          ],
                                        ),
                                      ),

                                    ),
                                  ),
                                ),),
                              Positioned(
                                bottom:height/120 ,
                                right:width/18 ,
                                child: GestureDetector(
                                  onTap: () async {
                                    await Provider.of<Prov_accept_req>(context,listen:false ).req_accept(prov.requests_list[index].id.toString());

                                   // await Provider.of<Prov_Pinding_Requests>(context,listen: false).getrequests();
                                  },
                                  child: Card(
                                    elevation: 3,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),topLeft: Radius.circular(15))
                                    ),
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: const BoxDecoration(
                                        color:Color.fromRGBO(10, 90, 0, 1),
                                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),topLeft: Radius.circular(15) ),
                                      ),
                                      height: height/28,
                                      width: width/4,
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(text:"قبول ",style:Theme.of(context).textTheme.bodyText1!.copyWith(
                                                fontSize: height/70,
                                                color: Colors.white,
                                                fontFamily: "cairo"
                                            ),),
                                            WidgetSpan(
                                              child: Icon(Icons.check, size: height/65,color: Colors.white,),
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
