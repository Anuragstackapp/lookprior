import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../app/shared_preference.dart';
import '../../common/constant/color_const.dart';
import '../../service/rest_service.dart';
import '../bootambar/bottambarpage.dart';

class PasswordChangPage extends StatefulWidget {
  const PasswordChangPage({Key? key}) : super(key: key);

  @override
  State<PasswordChangPage> createState() => _PasswordChangPageState();
}

class _PasswordChangPageState extends State<PasswordChangPage> {
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController conformPassword = TextEditingController();
  BuildContext? dialogContext;
  dynamic tokan;
  bool status = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTokan();
  }


 void getTokan() async {
    tokan = await SherdPref.getAccessTokan();
    setState(() {

    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: ColorsResources.registerScreen,
        title: Align(alignment: Alignment.center,child: Padding(
          padding: const EdgeInsets.only(right: 50),
          child: Text("Change Password",style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 16
          ),),
        )),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.grey.shade300,
        child: Column(
          children:  [
             Padding(
              padding: const EdgeInsets.only(right: 20,left: 20,top: 15),
              child: TextField(
                controller: oldPassword,
                  cursorColor:ColorsResources.registerScreen,
                decoration: InputDecoration(
                  hintText: 'Old Password',
                 hintStyle: GoogleFonts.poppins(
                   color: Colors.black,
                   fontWeight: FontWeight.w300
                 ),
                 contentPadding: const EdgeInsets.only(top: 15,left: 2),
                 focusedBorder: UnderlineInputBorder(
                   borderSide: BorderSide(color: ColorsResources.registerScreen),
                 )
                ),
                  style: const TextStyle(fontSize: 17)
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(right: 20,left: 20),
              child: TextField(
                controller: newPassword,
                  cursorColor:ColorsResources.registerScreen,
                  decoration: InputDecoration(
                      hintText: 'New Password',
                      hintStyle: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w300
                      ),
                      contentPadding: const EdgeInsets.only(top: 15,left: 2),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ColorsResources.registerScreen),
                      )
                  ),
                  style: const TextStyle(fontSize: 17)
              ),
            ),
            const SizedBox(height: 5,),
             Padding(
              padding: const EdgeInsets.only(right: 20,left: 20),
              child: TextField(
                controller: conformPassword,
                  cursorColor:ColorsResources.registerScreen,
                  decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      hintStyle: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w300
                      ),
                      contentPadding: const EdgeInsets.only(top: 15,left: 2),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ColorsResources.registerScreen),
                      )
                  ),
                  style: const TextStyle(fontSize: 17)
              ),
            ),
            const SizedBox(height: 10,),
            status ? Center(child: CircularProgressIndicator(color: ColorsResources.registerScreen)) : SizedBox(),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
              child: SizedBox(
                height: 40,
                width: double.infinity,
                child: ElevatedButton(onPressed: () async {

                  setState(() {
                    status = true;
                  });

                  String oldpassword = oldPassword.text;
                  String newPasswords = newPassword.text;
                  String cPassword = conformPassword.text;

                 if(newPasswords == cPassword && newPasswords.isNotEmpty && oldpassword.isNotEmpty && cPassword.isNotEmpty){
                   Map<String ,dynamic> password = {
                     "oldPassword": oldpassword,
                     "newPassword": newPasswords
                   };
                   Map<String, String>? headers = {
                     'Authorization':'Bearer $tokan'
                   };

                   String passwordBodyrespose = await RestService.postRestMethods(endPoint:'/api/v1/data/changepassword', bodyParam: password,headers: headers);
                   print("changePasswordBodyespose --> $passwordBodyrespose");

                   if(passwordBodyrespose != null && passwordBodyrespose.isNotEmpty){
                     Map<String,dynamic> passwordResponseMap = jsonDecode(passwordBodyrespose);
                     print("loginResponseMap ---> ${passwordResponseMap.toString()}");


                     showDialog(
                       barrierColor: Colors.transparent,
                       context: context, builder: (context) {

                       dialogContext = context;
                       closeDilog();
                       return AlertDialog(

                         backgroundColor: ColorsResources.registerScreen,
                         alignment: Alignment.bottomCenter,
                         content: Text('${passwordResponseMap['Message']}',style: GoogleFonts.poppins(
                             fontWeight: FontWeight.w400,
                             color: Colors.white,
                             fontSize: 13
                         )),
                       );
                     },);

                     if(passwordResponseMap.containsKey('Success') && passwordResponseMap['Success']){
                       setState(() {
                         status = false;
                       });

                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                         return BottambarPage();
                       },));

                     }
                     // else {
                     //
                     //
                     // }

                   }

                 }else{
                   showDialog(
                     barrierColor: Colors.transparent,
                     context: context, builder: (context) {

                     dialogContext = context;
                    closeDilog();
                     return AlertDialog(

                       backgroundColor: ColorsResources.registerScreen,
                       alignment: Alignment.bottomCenter,
                       content: Text('Password Not Match',style: GoogleFonts.poppins(
                         fontWeight: FontWeight.w400,
                         color: Colors.white,
                         fontSize: 13
                       )),
                     );
                   },);

                 }

                },style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsResources.registerScreen,
                ), child: Text("Update Password",style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  color: Colors.white,
                ),),),
              ),
            ),

          ],
        ),

      ),
    );
  }

  closeDilog() async {

   await Future.delayed(Duration(seconds: 1));
   setState(() {
     status = false;
   });
    Navigator.pop(dialogContext!);
  }
}
