import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lookprior/common/widget/common_navigator.dart';
import 'package:lookprior/screens/register_screens/model/facbook_users_model.dart';
import 'package:lookprior/screens/register_screens/register_screens.dart';
import 'package:lookprior/service/rest_service.dart';
import '../../common/constant/color_const.dart';
import '../../common/constant/image_const.dart';
import '../../common/widget/custom_button.dart';
import '../../common/widget/elevated_button.dart';
import '../login_screen/login_screen.dart';

String prettyPrint(Map json) {
  JsonEncoder encoder = const JsonEncoder.withIndent('  ');
  String pretty = encoder.convert(json);
  return pretty;
}

class RegisterPageViewModel{

  TextEditingController names = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cpassword = TextEditingController();
  String? code;
  late Facbookusers facbookusers;
  FirebaseMessaging firebaseMessaging =  FirebaseMessaging.instance;
  bool checkStatus = false;
  Map<String, dynamic>? facbookuser;
  Map<String, dynamic>? userDatas;
  AccessToken? accessTokens;
  bool checking = true;


  RegisterScreensState? registerScreensState;

  RegisterPageViewModel(this.registerScreensState);

  // Future<void> checkIfIsLogged() async {
  //   final accessToken = await FacebookAuth.instance.accessToken;
  //   registerScreensState!.setState(() {
  //     checking = false;
  //   });
  //   if (accessToken != null) {
  //     print("is Logged:::: ${prettyPrint(accessToken.toJson())}");
  //     // now you can call to  FacebookAuth.instance.getUserData();
  //     final userData = await FacebookAuth.instance.getUserData();
  //     // final userData = await FacebookAuth.instance.getUserData(fields: "email,birthday,friends,gender,link");
  //     accessTokens = accessToken;
  //     registerScreensState!.setState(() {
  //       userDatas = userData;
  //     });
  //   }
  // }
  void printCredentials() {
    print(
      prettyPrint(accessTokens!.toJson()),
    );
  }
  Future<void> login() async {

    final LoginResult result = await FacebookAuth.instance.login(); // by default we request the email and the public profile

    if (result.status == LoginStatus.success) {
      accessTokens = result.accessToken;
      printCredentials();
      // get the user data
      // by default we get the userId, email,name and picture
      final userData = await FacebookAuth.instance.getUserData();
      final facbook = jsonEncode(userData);
      facbookusers = facbookusersFromJson(facbook);

      // final userData = await FacebookAuth.instance.getUserData(fields: "email,birthday,friends,gender,link");
      print(" facbook Users Data ----> name :--> ${facbookusers.name} id:--->${facbookusers.id} pic:----> ${facbookusers.picture!.data!.url}");
      String? deviceToken = await firebaseMessaging.getToken();
      Map<String ,dynamic> facbookSignUp = {
        "devicetoken": "$deviceToken",
        "devicetype": '1',
        "email": "google@google.com",
        "fbId": "${facbookusers.id}",
        "userName": "${facbookusers.name}",
        "facebookProfileUrl": "${facbookusers.picture!.data!.url}",
        "mobileVersion": "IOS",
        "osVersion": "10.11",
        "ViaSocial": '1'
      };

      try{
        String? sigupBodyespose = await RestService.postRestMethods(endPoint: '/api/v1/data/signin', bodyParam: facbookSignUp);
        print("sigupBodyespose --> ${sigupBodyespose}");
        if(sigupBodyespose != null && sigupBodyespose.isNotEmpty){
          Map<String,dynamic> signUpResponseMap = jsonDecode(sigupBodyespose);
          print("facbooksignUpResponseMap ---> ${signUpResponseMap.toString()}");

          if(signUpResponseMap.containsKey('Success') && signUpResponseMap['Success']){
            SnackBar(content: Text('${signUpResponseMap['Message']}'));
          }else{
            SnackBar(content: Text('${signUpResponseMap['Message']}'));
          }

        }
      } on SocketException catch (e){
        print('facbook error ---> ${e}');
      }


      userDatas = userData;

    } else {
      print(result.status);
      print(result.message);
    }

    registerScreensState!.setState(() {
      checking = false;
    });
  }

  Future<void> logOut() async {
    await FacebookAuth.instance.logOut();
    accessTokens = null;
    userDatas = null;
    registerScreensState!.setState(() {});
  }

  Widget facbookButton(){
    return Padding(
      padding: const EdgeInsets.only(left: 25,top: 10,right: 25),
      child: CustomWidgets.socialButtonRect(
        userDatas != null ? "LOGOUT" : "Login with Facebook",ColorsResources.facbookButton, ImageResources.facebook,
        onTap:  userDatas != null ? logOut : login,

      ),
    );
  }

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
