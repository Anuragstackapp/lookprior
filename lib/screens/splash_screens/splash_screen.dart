import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lookprior/common/constant/image_const.dart';
import 'package:lookprior/common/constant/string_const.dart';
import 'package:lookprior/common/widget/widget.dart';
import 'package:lookprior/screens/bootambar/bottambarpage.dart';
import 'package:lookprior/screens/first_page/first_page.dart';
import 'package:lookprior/screens/login_screen/login_screen.dart';
import 'package:lookprior/screens/register_screens/register_screens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    nextScreen();
  }

  Future nextScreen() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return BottambarPage();
    },));

  }


  @override
  Widget build(BuildContext context) {
    statusBarColor();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Center(
          child: Container(
            // color: Colors.red,
            height: size.height/6,
            width: size.width/2,
            child: Image.asset(ImageResources.splaceLogo,),

          ),
        ),
        SizedBox(height: 19,),
        Align(
          alignment: Alignment.center,
          child: Text(StringResources.splaceTitle,style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 18,
          )),
        ),

      ],)),
    );
  }
}
