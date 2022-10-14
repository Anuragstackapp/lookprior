import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lookprior/common/constant/color_const.dart';
import 'package:lookprior/common/constant/image_const.dart';
import 'package:lookprior/common/widget/custom_button.dart';
import 'package:lookprior/common/widget/elevated_button.dart';
import 'package:lookprior/common/widget/text_form_field.dart';
import 'package:lookprior/screens/login_screen/login_screen.dart';


void statusBarColor() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: ColorsResources.registerScreen,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
}

Widget name() {
  return Align(
    alignment: Alignment.center,
    child: Padding(
      padding: const EdgeInsets.only(left: 25, top: 30, right: 25),
      child: AppTextField(

        prefixIcon: Padding(
          padding: const EdgeInsets.only(bottom: 8,top: 8,right: 8,left: 4),
          child: SvgPicture.asset(ImageResources.userIcon),
        ),
        hintText: 'Your Name',
        lable: 'Your Name',

      ),
    ),
  );
}

Widget email() {
  return Align(
    alignment: Alignment.center,
    child: Padding(
      padding: const EdgeInsets.only(left: 25, top: 15, right: 25),
      child: AppTextField(

        prefixIcon: Padding(
          padding: const EdgeInsets.only(bottom: 8,top: 8,right: 8,left: 4),
          child: SvgPicture.asset(ImageResources.emailIcon),
        ),
        hintText: 'Email Address',
        lable: 'Email Address',
      ),
    ),
  );
}

Widget password() {
  return Align(
    alignment: Alignment.center,
    child: Padding(
      padding: const EdgeInsets.only(left: 25, top: 15, right: 25),
      child: AppTextField(
        validator: (value) {
          if(value == null){
            return 'enter user email address';
          }
          return null;
        },
        prefixIcon: Padding(
          padding: const EdgeInsets.only(top: 9,right: 9,bottom: 9,left: 9),
          child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFFFEAFAF1),
                  borderRadius: BorderRadius.circular(3)),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: SvgPicture.asset(ImageResources.passwordIcon),
              )),
        ),
        hintText: 'Password',
        lable: 'Password',
      ),
    ),
  );
}
Widget conformPassword() {
  return Align(
    alignment: Alignment.center,
    child: Padding(
      padding: const EdgeInsets.only(left: 25, top: 15, right: 25),
      child: AppTextField(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(top: 9,right: 9,bottom: 9,left: 9),
          child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFFFEAFAF1),
                  borderRadius: BorderRadius.circular(3)),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: SvgPicture.asset(ImageResources.passwordIcon),
              )),
        ),
        hintText: 'Confirm password',
        lable: 'Confirm password',
      ),
    ),
  );
}
Widget registerButton(BuildContext context){
  return Padding(
    padding: const EdgeInsets.only(left: 25,top: 30,right: 25),
    child: CommonElevatedButton(
      onPressed: () {

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return LoginScreen();
        },));
      },
      textColor: Colors.white,
      buttonColor: ColorsResources.registerScreen,
      text: 'Register',
    ),
  );
}

Widget facbookButton(){
  return Padding(
    padding: const EdgeInsets.only(left: 25,top: 10,right: 25),
    child: CustomWidgets.socialButtonRect(
        "Login with Facebook", ColorsResources.facbookButton, ImageResources.facebook,

    ),
  );
}

Widget appleButton(){
  return Padding(
    padding: const EdgeInsets.only(left: 25,top: 15,right: 25),
    child: CustomWidgets.socialButtonRect(
      "Login with Apple", ColorsResources.appleButton, ImageResources.apple,

    ),
  );
}

Widget information(){
  return FittedBox(
    child: Padding(
      padding: const EdgeInsets.only(left: 31,right: 30,top: 15,bottom: 5),
      child: Text("By Clicking on “Register with Facebook” or “Register” you Agree \n      To the Lookprior Terms of Service and Privacy Policy",style: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,color: Colors.grey
      )),
    ),
  );
}

