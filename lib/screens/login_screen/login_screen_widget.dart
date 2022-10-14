import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lookprior/common/widget/textbutton.dart';
import 'package:lookprior/screens/first_page/first_page.dart';
import 'package:lookprior/screens/register_screens/register_screens.dart';

import '../../common/constant/color_const.dart';
import '../../common/widget/elevated_button.dart';
import 'login_screen.dart';

Widget loginTitelText(){
  return FittedBox(
    child: Padding(
      padding: const EdgeInsets.only(top: 27),
      child: Text("Hey, It’s good to see you again!",style: GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        color: Colors.black,
        fontSize: 18,
      ),),
    ),
  );
}

Widget loginSecondTitelText(){
  return FittedBox(
    child: Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Text("Login to get going",style: GoogleFonts.poppins(

        fontWeight: FontWeight.w400,
        color: Colors.grey,
        fontSize: 16,
      ),),
    ),
  );
}

Widget loginButton(BuildContext context){
  return Padding(
    padding: const EdgeInsets.only(left: 25,top: 15,right: 25),
    child: CommonElevatedButton(
      onPressed: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return FirstPage();
        },));
      },
      textColor: Colors.white,
      buttonColor: ColorsResources.registerScreen,
      text: 'Login',
    ),
  );
}

Widget registerAccount(BuildContext context){
  return Padding(
    padding: const EdgeInsets.only(left: 60,right: 60),
    child: FittedBox(
      child: Row(
        children: [
          Text("Didn’t have an account?",style: GoogleFonts.poppins(
            fontSize: 13,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          )),
          TextButton(onPressed: () {

            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
              return RegisterScreens();
            },));
          }, child: Text("Register",style:GoogleFonts.poppins(
            fontSize: 13,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ) ,))
        ],
      ),
    ),
  );
}