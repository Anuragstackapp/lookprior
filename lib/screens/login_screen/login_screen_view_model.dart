import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lookprior/screens/login_screen/login_screen.dart';

import '../../common/constant/color_const.dart';
import '../../common/constant/image_const.dart';
import '../../common/widget/custom_button.dart';
import '../../common/widget/elevated_button.dart';

class LoginScreenViewModel{

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  FirebaseMessaging firebaseMessaging =  FirebaseMessaging.instance;
  bool checkStatus = false;

  LoginScreenState? loginScreenState;
  LoginScreenViewModel(this.loginScreenState);

  Widget facbookButton(){
    return Padding(
      padding: const EdgeInsets.only(left: 25,top: 10,right: 25),
      child: CustomWidgets.socialButtonRect(
        onTap: () {

        },
        "Login with Facebook", ColorsResources.facbookButton, ImageResources.facebook,
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
                  loginScreenState!.setState(() {
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