import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lookprior/common/constant/color_const.dart';
import 'package:lookprior/common/constant/image_const.dart';
import 'package:lookprior/common/constant/string_const.dart';
import 'package:lookprior/common/widget/elevated_button.dart';
import 'package:lookprior/screens/login_screen/login_screen.dart';


import '../../common/widget/text_form_field.dart';






Future alertDilog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        icon: Image.asset(ImageResources.alertTitleIcon),
        title: Text('Welcome!',
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 24,
            )),
        content: Text(StringResources.alertDiscripson,
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w500,
            )),
        actions: [
          postAdButton(context),
          browserAdButton(context),
        ],
      );
    },
  );
}


Widget postAdButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
    child: CommonElevatedButton(
      onPressed: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return LoginScreen();
        },));
      },
      text: 'Post my first ad now',
      textSize: 14,
      buttonColor: ColorsResources.registerScreen,
      textColor: Colors.white,
    ),
  );
}

Widget browserAdButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
    child: CommonElevatedButton(
      onPressed: () {
        Navigator.pop(context);
      },
      text: 'Browse Listing',
      buttonColor: Colors.black,
      textColor: Colors.white,
      textSize: 14,
    ),
  );
}

Widget seachTextFild() {
  return Align(
    alignment: Alignment.center,
    child: Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(

        decoration: BoxDecoration(
          color: Color(0xFF19C060),
          borderRadius: BorderRadius.circular(5),
        ),
        child: AppTextField(

          prefixIcon: Padding(
            padding: const EdgeInsets.only(bottom: 8, top: 8, right: 8, left: 4),
            child: SvgPicture.asset(ImageResources.searchIcon),
          ),
          hintText: 'Search here',
          lable: 'Search here',
          hintcolor: Colors.white,
        ),
      ),
    ),
  );
}

Widget categoryName() {
  return Align(
    alignment: Alignment.topLeft,
    child: Padding(
      padding: const EdgeInsets.only(left: 22, top: 17),
      child: Text(
        "Category",
        style: GoogleFonts.poppins(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
      ),
    ),
  );
}

Widget adsText(){
  return Padding(
    padding: const EdgeInsets.only(top: 10,left: 16,right: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text("Top Ads",style: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w600,

      )),
      Text("See all >",style: GoogleFonts.poppins(
        color: ColorsResources.registerScreen,
        fontSize: 14,
        fontWeight: FontWeight.w400,

      ),)
    ],),
  );
}



//
// Widget categoryItem() {
//
//
//
//   return  SizedBox(
//     height: 102,
//     child: ListView.builder(
//       itemCount: 4,
//       scrollDirection: Axis.horizontal,
//       itemBuilder: (context, index) {
//         return Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(left: 10,right: 10,top: 18),
//               child: Container(
//                 height: 71,
//                 width: 74,
//                 // margin: const EdgeInsets.only(
//                 //     top: 10, left: 5, bottom: 8, right: 5),
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                   color:
//                   const Color(0xff2ECC71).withOpacity(0.1),
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: SvgPicture.asset(
//                     img[index],
//                   ),
//                 ),
//               ),
//             ),
//             // CommonText(
//             //   text: name[index],
//             //   fontSize: 11,
//             //   fontWeight: FontWeight.w400,
//             // )
//           ],
//         );
//       },
//     ),
//   );
// }
