import 'package:flutter/material.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:illuminate/providers/Prov_addpost.dart';
import 'package:illuminate/providers/Prov_profile.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
class Add_post_screen extends StatefulWidget {

  static const scid="add_post";

  const Add_post_screen({Key? key}) : super(key: key);

  @override
  State<Add_post_screen> createState() => _Add_post_screenState();
}

class _Add_post_screenState extends State<Add_post_screen> with SingleTickerProviderStateMixin {
  IconData flicon=Icons.add;
  Animation<double> ? _animation;
  AnimationController?  _animationController;

  @override
  void initState(){

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation = CurvedAnimation(curve: Curves.easeInOut, parent: _animationController!);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);


    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    var height=size.height;
    var width=size.width;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).unselectedWidgetColor,
              borderRadius: BorderRadius.circular(width/20),

            ),
            margin: EdgeInsets.symmetric(horizontal: width/80,vertical: height/60),
            height: height/15,
            width: width/8,
            child: Text("اضافه",style:TextStyle(
              color: Colors.white,
              fontSize: width/30
            ),),
            alignment: Alignment.center,

          ),
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).pop();
          }, icon:Icon(Icons.close,size: width/15,color:Theme.of(context).unselectedWidgetColor,)),
        ],

      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,

        //Init Floating Action Bubble
        floatingActionButton: Padding(
          padding: EdgeInsets.symmetric(horizontal:width/120,vertical: width/20),
          child: FloatingActionBubble(
            // Menu items
            items: <Bubble>[

              // Floating action menu item
              Bubble(

                title:"اضافة صوره بواسطة الكاميرا",

                iconColor :Colors.white,
                bubbleColor :Theme.of(context).unselectedWidgetColor,
                icon:Icons.camera_alt,
                titleStyle:TextStyle(fontSize:width/30 , color: Colors.white),
                onPress: () async{
                  await Provider.of<Prov_add_post>(context,listen: false).Pickimagefromsource(ImageSource.camera);
                  setState(() {
                    flicon=Icons.add;
                  });
                  _animationController!.reverse();
                },
              ),
              // Floating action menu item
              Bubble(
                title:"اضافة صوره بواسطة الاستوديو",
                iconColor :Colors.white,
                bubbleColor : Theme.of(context).unselectedWidgetColor,
                icon:Icons.collections,
                titleStyle:TextStyle(fontSize:width/30 , color: Colors.white),
                onPress: () async{
                  await Provider.of<Prov_add_post>(context,listen: false).Pickimagefromsource(ImageSource.gallery);
                  setState(() {
                    flicon=Icons.add;
                  });
                  _animationController!.reverse();
                },
              ),
              //Floating action menu item
              Bubble(
                title:"اضافة الموقع",
                iconColor :Colors.white,
                bubbleColor : Theme.of(context).unselectedWidgetColor,
                icon:Icons.location_on,
                titleStyle:TextStyle(fontSize:width/30 , color: Colors.white),
                onPress: () {
                  Provider.of<Prov_add_post>(context,listen: false).setloc(Provider.of<Prov_profile_page>(context,listen: false).Address);

                  setState(() {
                    flicon=Icons.add;
                  });
                  _animationController!.reverse();
                },
              ),
            ],

            // animation controller
            animation: _animation!,

            // On pressed change animation state
            onPress: (){
              if(  _animationController!.isCompleted) {
                _animationController!.reverse();
                setState(() {
                  flicon=Icons.add;
                });
              }
              else {
                _animationController!.forward();
                setState(() {
                  flicon=Icons.close;
                });
              }

            },

            // Floating Action button Icon color
            iconColor:Theme.of(context).unselectedWidgetColor,

            // Flaoting Action button Icon
            iconData: flicon,
            backGroundColor: Theme.of(context).appBarTheme.backgroundColor!,
          ),
        ),
      body:Padding(
          padding: EdgeInsets.symmetric(horizontal: width/40),
        child: Column(
          children: [
            Container(

              height: height/5,
              width: width,
              child: TextField(
                style: TextStyle(
                  fontSize: width/30
                ),
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
                decoration:InputDecoration(
                  hintText: " ماذا يدور فى عقلك ؟",
                  hintStyle: TextStyle(
                  ),

                  border: InputBorder.none
                ) ,
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                maxLength: 100,
              ),
            ),
            Expanded(
              flex: 2,
                child:Consumer<Prov_add_post>(
                  builder:(context,pr,ch)=>pr.imgfile!=null? Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      border: Border.all(color: Colors.black38,width: width/120),
                      borderRadius: BorderRadius.circular(width/20)
                    ),

                    alignment: Alignment.center,
              child: Center(child: Image.file(pr.imgfile!)),
            ):Container(),
                )),

              Consumer<Prov_add_post>(
              builder:(context,pr,ch)=>pr.location!=null? Container(
              decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.circular(width/20)
              ),
              alignment: Alignment.center,
              child:Container(
                margin: EdgeInsets.symmetric(vertical: height/110),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width/30),
                    color: Theme.of(context).unselectedWidgetColor,
                ),
                height: height/15,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: width/50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.location_on,color: Colors.white,),
                      Text(pr.location.toString(),style:TextStyle(
                        color: Colors.white
                      ))
                    ],

                  ),
                ),
              )
              ):Container(),
              ),
            Expanded(
              child: SizedBox(

              ),
            ),
          ],
        ),
      ) ,
    );
  }
}
