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
import 'package:lookprior/screens/first_page/first_page.dart';
import 'package:lookprior/screens/login_screen/googlesign.dart';
import 'package:lookprior/screens/login_screen/login_screen.dart';


void statusBarColor() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: ColorsResources.registerScreen,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
}




Widget appleButton(BuildContext context){
  return Padding(
    padding: const EdgeInsets.only(left: 25,top: 15,right: 25),
    child: CustomWidgets.socialButtonRect(
      onTap: () async {
        debugPrint("Done Google");
       await GoogleSign().signInGoogle();
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        //   return FirstPage();
        // },));

      },
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



