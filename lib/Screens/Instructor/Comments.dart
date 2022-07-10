import 'package:auto_size_text/auto_size_text.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:illuminate/networks/get_data/get_posts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../providers/Shared_pref.dart';
class commentBox extends StatefulWidget {
  static const scid='comments';
  var postid;
   commentBox({Key? key,required this.postid}) : super(key: key);

  @override
  _commentBoxState createState() => _commentBoxState();
}

class _commentBoxState extends State<commentBox> {

  var fetchAndSetFuture;
  @override
  void initState() {
    super.initState();
    fetchAndSetFuture = Provider.of<Prov_get_posts>(context, listen: false).get_comments(widget.postid);
  }

  final TextEditingController commentController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    var size=MediaQuery.of(context).size;
    var height=size.height;
    var width=size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("التعليقات",style: Theme.of(context).textTheme.subtitle1!.copyWith(
          color: Theme.of(context).unselectedWidgetColor,
              fontSize: height/30
        ),),
        centerTitle: true,
        elevation: 2,
        backgroundColor:Theme.of(context).appBarTheme.backgroundColor,
        leading: Container(
          margin: EdgeInsets.only(left: width/60),
          child: Stack(
            alignment: Alignment.center,
            children: [

            ],
          ),
        ),
        leadingWidth: width/10,
      //<Widget>[]
      ),

        body:  Container(

            color: Theme.of(context).backgroundColor,

            child: CommentBox(
                userImage:'http://mohamedelbadry.me/illuminate/${Provider.of<Prov_Shared_Pref>(context,listen: false).teach_prof_data!.data!.profile!.image}',
                child: commentChild(),
                labelText: 'كتابة تعليق..',
                withBorder: false,
                errorText: 'يجب كتابة تعليق لاضافته',
                sendButtonMethod: ()async {
                  if (formKey.currentState!.validate()) {
                      await Provider.of<Prov_get_posts>(context,listen:false).Add_comments(widget.postid,commentController.text);
                    commentController.clear();
                    FocusScope.of(context).unfocus();


                  } else {
                    print("Not validated");
                  }
                },
                formKey: formKey,
                commentController: commentController,
                backgroundColor: Colors.blueGrey,
                textColor: Theme.of(context).textTheme.bodyText1!.backgroundColor,
                sendWidget: Icon(Icons.send_sharp, size: 30, color:Theme.of(context).unselectedWidgetColor),
              ),
            ));
  }
  @override
  Widget commentChild () {
    var size=MediaQuery.of(context).size;
    var height=size.height;
    var width=size.width;
    return  StreamBuilder(
      stream: Provider.of<Prov_get_posts>(context).get_comments(widget.postid).asStream(),
      builder:(context,snapshot)=> snapshot.hasData? Center(
        child: CircularProgressIndicator(),
      ): ListView(

        children: [
          for(var i in Provider.of<Prov_get_posts>(context).Coments_list)
            Padding(
              padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
              child: ListTile(
                leading: Container(
                    height: height/10,
                    width: width/8,
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage('http://mohamedelbadry.me/illuminate/images/${i.userImage!.split('/').last}',),
                      ),
                      border: Border.all(width: height/350,color: Theme.of(context).unselectedWidgetColor,),
                    )

                ),
                trailing:DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    customButton: Icon(
                      Icons.share_outlined,
                      size: width/15,
                      color: Theme.of(context).unselectedWidgetColor,
                    ),


                    items: [
                      DropdownMenuItem(child:GestureDetector(
                        onTap: ()async{
                          var whatsappUrl ="whatsapp://send?phone=+20${i.phone}";
                          await launchUrl(Uri.parse(whatsappUrl))? launchUrl(Uri.parse(whatsappUrl)):print("");
                        },

                        child: ListTile(title: Container(
                          child: Text("التواصل عن طريق واتساب",textAlign: TextAlign.right,style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              fontSize: width/35
                          ),),
                          height: height/10,
                          width: width/2.5,
                          alignment: Alignment.centerRight,
                        ),leading: Container(
                          alignment: Alignment.centerLeft,
                          height: height/10,
                          width: width/14,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/img/whatsapp.png"),
                              fit: BoxFit.contain,
                            ),
                          ),)),
                      ),
                        value: "",

                      ),
                      DropdownMenuItem(child:GestureDetector(
                          onTap: ()async{
                            var whatsappUrl ="mailto:${i.email}";
                            await launchUrl(Uri.parse(whatsappUrl))? launchUrl(Uri.parse(whatsappUrl)):print("");
                          },

                          child: ListTile(title: Container(
                            child: Text("التواصل عن طريق الجيميل",textAlign: TextAlign.right,style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                fontSize: width/35
                            ),),
                            height: height/10,
                            width: width/2.5,
                            alignment: Alignment.centerRight,
                          ),leading: Container(
                            alignment: Alignment.centerLeft,
                            height: height/10,
                            width: width/14,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/img/gmail.png"),
                                fit: BoxFit.contain,
                              ),
                            ),))),
                        value: "",

                      ),
                    ],
                    onChanged: (value) {

                    },
                    dropdownMaxHeight: height/6,
                    itemHeight: height/18,
                    itemPadding: EdgeInsets.symmetric(horizontal: width/120,vertical: height/220),
                    dropdownWidth: width/1.8,

                    dropdownPadding: const EdgeInsets.symmetric(vertical: 0,horizontal: 0),
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Theme.of(context).backgroundColor,
                    ),
                    dropdownElevation: 8,

                  ),
                ), /*GestureDetector(
                  onTap: () async {
                    // Display the image in large form.
                    print("Comment Clicked");
                  },
                  child:
                  /*Container(
                    height: height/10,
                    width: width/8,
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage('http://mohamedelbadry.me/illuminate/images/${i.userImage!.split('/').last}',),
                      ),
                        border: Border.all(width: height/350,color: Theme.of(context).unselectedWidgetColor,),
                    )

                  ),*/
                ),*/
                title: AutoSizeText(
                  i.userName.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(i.body.toString()),
              ),
            )



        ],
      ),
    );
  }
}
