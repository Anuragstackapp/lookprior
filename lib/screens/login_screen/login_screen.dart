import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lookprior/common/widget/commane_scroll_behavior.dart';
import 'package:lookprior/common/widget/widget.dart';
import 'package:lookprior/screens/login_screen/login_screen_widget.dart';
import 'package:lookprior/screens/register_screens/widget.dart';

import '../../common/constant/color_const.dart';
import '../../common/constant/image_const.dart';
import '../../common/constant/string_const.dart';
import '../../common/widget/text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // key: formKey,
      body: SafeArea(
          child: Container(
            height: size.height,
            width: size.width,
            color: ColorsResources.registerScreen,
            child: Stack(
              children: [
                Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 38),
                      child:Image.asset(ImageResources.registerLogo,height: 56,width: 87),
                    )),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 107),
                    child: Text(
                      StringResources.loginTitle,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 26,
                      ),
                    ),
                  ),
                ),
                Align(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 162),
                    child: Container(
                      height: double.infinity,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                      ),
                      child: ScrollConfiguration(
                        behavior: MyBehavior(),
                        child: SingleChildScrollView(

                          child: Column(
                            children: [
                              loginTitelText(),
                              loginSecondTitelText(),
                              Padding(
                                padding: const EdgeInsets.only(top: 18),
                                child:  Align(
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
                                      hintcolor: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
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
                                      padding: const EdgeInsets.only(top: 9,right: 13,bottom: 9,left: 13),
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
                                    hintcolor: Colors.grey,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 18),
                                  child: TextButton(onPressed: () {

                                  }, child: Text("Forgot password?",style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    fontSize: 13,
                                  ),)),
                                ),
                              ),
                              loginButton(context),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: divderrow(),
                              ),
                              facbookButton(),
                              appleButton(),
                              registerAccount(context),


                              // conteryCode(context),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
