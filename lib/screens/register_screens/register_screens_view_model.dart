import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lookprior/screens/register_screens/register_screens.dart';
import 'package:lookprior/service/rest_service.dart';
import '../../common/constant/color_const.dart';
import '../../common/widget/elevated_button.dart';



class RegisterPageViewModel{

  TextEditingController names = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cpassword = TextEditingController();
  String? code;

  RegisterScreensState? registerScreensState;

  RegisterPageViewModel(this.registerScreensState);



  Widget registerButton(BuildContext context, {TextEditingController? name, String? code,TextEditingController? email,TextEditingController? phone,TextEditingController? password,TextEditingController? cpassword}){
    return Padding(
      padding: const EdgeInsets.only(left: 25,top: 30,right: 25),
      child: CommonElevatedButton(
        onPressed: () async {

          Map<String ,dynamic> sigunUp = {
            "email" : 'auarg@',
            "name" : 'anc'
          };

         String? sigupBodyespose = await RestService.postRestMethods(endPoint: RestService.signUpeApi, bodyParam: sigunUp);

         print("sigupBodyespose --> ${sigupBodyespose}");
          if(sigupBodyespose != null && sigupBodyespose.isNotEmpty){
            Map<String,dynamic> signUpResponseMap = jsonDecode(sigupBodyespose);

            print("signUpResponseMap ---> ${signUpResponseMap.toString()}");
            if(signUpResponseMap.containsKey('Success') && signUpResponseMap['Success']){

            }

          }

          if(name!.text.isEmpty){

          }else if(email!.text.isEmpty){

          }else if(phone!.text.isEmpty){

          }else if(password!.text.isEmpty){

          }else if(password.text != cpassword!.text){

          }

          // print("print name  -->  ${name!.text}");
          // print("print code!  -->  ${code} name --> ${name.text} mail -->  ${email!.text} phone -->  ${phone!.text} password -->  ${password!.text} cpassword -->  ${cpassword!.text}");

          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          //   return LoginScreen();
          // },));

        },
        textColor: Colors.white,
        buttonColor: ColorsResources.registerScreen,
        text: 'Register',
      ),
    );
  }

}


// /*
//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:lookprior/common/widget/widget.dart';
//
// import '../../common/constant/color_const.dart';
// import '../../common/constant/image_const.dart';
// import '../../common/constant/string_const.dart';
//
// class RegisterScreenViewModel extends StatelessWidget {
//   const RegisterScreenViewModel({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     statusBarColor();
//     final size = MediaQuery.of(context).size;
