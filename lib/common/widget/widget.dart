import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lookprior/common/constant/color_const.dart';
import 'package:lookprior/common/constant/image_const.dart';
import 'package:lookprior/common/widget/elevated_button.dart';
import 'package:lookprior/common/widget/text_form_field.dart';

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
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(ImageResources.userIcon),
        ),
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
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(ImageResources.emailIcon),
        ),
        hintText: 'enter youre email',
        lable: 'email',
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
        prefixIcon: Padding(
          padding: const EdgeInsets.only(top: 9,right: 9,bottom: 9,left: 15),
          child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFFFEAFAF1),
                  borderRadius: BorderRadius.circular(3)),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: SvgPicture.asset(ImageResources.passwordIcon),
              )),
        ),
        hintText: 'enter youre email',
        lable: 'email',
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
          padding: const EdgeInsets.only(top: 9,right: 9,bottom: 9,left: 15),
          child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFFFEAFAF1),
                  borderRadius: BorderRadius.circular(3)),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: SvgPicture.asset(ImageResources.passwordIcon),
              )),
        ),
        hintText: 'enter youre email',
        lable: 'email',
      ),
    ),
  );
}
Widget registerButton(){
  return CommonElevatedButton(
    textColor: Colors.white,
    buttonColor: ColorsResources.registerScreen,
    text: 'Register',
  );
}
