
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lookprior/common/constant/color_const.dart';
import 'package:lookprior/common/constant/image_const.dart';
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
          padding: const EdgeInsets.all(9.0),
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
          padding: const EdgeInsets.all(9.0),
          child: SvgPicture.asset(ImageResources.emailIcon),
        ),
        hintText: 'enter youre email',
        lable: 'email',
      ),
    ),
  );
}

Widget phone(){
  return Container(
    child: Row(
      children: [

      ],
    ),
  );
}






