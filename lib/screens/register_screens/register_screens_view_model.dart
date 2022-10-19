import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lookprior/screens/register_screens/register_screens.dart';
import 'package:lookprior/service/rest_service.dart';
import '../../common/constant/color_const.dart';
import '../../common/widget/elevated_button.dart';
import '../login_screen/login_screen.dart';



class RegisterPageViewModel{

  TextEditingController names = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cpassword = TextEditingController();
  String? code;
  FirebaseMessaging firebaseMessaging =  FirebaseMessaging.instance;
  bool checkStatus = false;



  RegisterScreensState? registerScreensState;

  RegisterPageViewModel(this.registerScreensState);

  alertDilog(BuildContext context,{String? messge}){
   return showDialog(
     barrierDismissible: false,
     context: context, builder: (context) {
     return Padding(
       padding: const EdgeInsets.only(right: 10,left: 10),
       child: AlertDialog(
         alignment: Alignment.center,
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(10),
         ),
         content: Text(messge!,
             overflow: TextOverflow.clip,
             style: GoogleFonts.poppins(
           fontWeight: FontWeight.w500,
           color: Colors.black,
           fontSize: 18,

         )),
         actions: [
           Padding(
             padding: const EdgeInsets.only(left: 20,right: 20,top: 15,bottom:5),
             child: CommonElevatedButton(
               onPressed: () {
                 registerScreensState!.setState(() {
                   checkStatus = false;
                 });

                 Navigator.pop(context);
               },
               textSize: 20,
               buttonColor: ColorsResources.registerScreen,
               text: 'Ok',
               borderRadius: 10,
               textColor: Colors.white,

             ),
           ),
         ],
       ),
     );
   },);
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
