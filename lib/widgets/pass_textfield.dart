import 'package:flutter/material.dart';
class password_txtfield extends StatelessWidget {
 password_txtfield({
    required this.controller,
    required this.prov,
    required this.width,
  }) ;

  final TextEditingController? controller;
  var prov;
  final double width;

  @override
  Widget build(BuildContext context) {

      return Center(
        child: TextFormField(
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.right,
          textAlignVertical: TextAlignVertical.top,
          validator: (val)=>val!.isEmpty?"user cant be blank":null,
          controller: controller,

          keyboardType: TextInputType.visiblePassword,
          obscureText: prov.showdata1!,
          style: const TextStyle(
              color: Color.fromRGBO(204, 88, 76, 1)
          ),
          decoration: InputDecoration(
            errorText: "",
            prefixIcon: IconButton(onPressed: () {
              prov.changeshow(prov.showdata1);
            }, icon:prov.showdata==true? const Icon(Icons.visibility_off_sharp):const Icon(Icons.visibility_sharp),



            ),
            hintText: 'الرجاء ادخال كلمة المرور',
            hintStyle: const TextStyle(
                fontSize: 12,
                color: Color.fromRGBO(204, 88, 76, 1)

            ),

            errorStyle: const TextStyle(

            ),

            contentPadding: EdgeInsets.only(
                right: width/60

            ),
          ),



        ),
      );
  }
}