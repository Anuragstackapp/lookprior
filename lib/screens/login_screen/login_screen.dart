import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lookprior/app/shared_preference.dart';
import 'package:lookprior/common/widget/commane_scroll_behavior.dart';
import 'package:lookprior/common/widget/widget.dart';
import 'package:lookprior/screens/login_screen/login_screen_view_model.dart';
import 'package:lookprior/screens/login_screen/login_screen_widget.dart';
import 'package:lookprior/screens/register_screens/widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/constant/color_const.dart';
import '../../common/constant/image_const.dart';
import '../../common/constant/string_const.dart';
import '../../common/widget/elevated_button.dart';
import '../../common/widget/text_form_field.dart';
import '../../service/rest_service.dart';
import '../first_page/first_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  LoginScreenViewModel? loginScreenViewModel;


  @override
  Widget build(BuildContext context) {
    loginScreenViewModel = (loginScreenViewModel ?? LoginScreenViewModel(this));

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
                  child: Image.asset(ImageResources.registerLogo,
                      height: 56, width: 87),
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
                            child: Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 25, top: 15, right: 25),
                                child: AppTextField(
                                  textEditingController:
                                      loginScreenViewModel!.email,
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 8, top: 8, right: 8, left: 4),
                                    child: SvgPicture.asset(
                                        ImageResources.emailIcon),
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
                              padding: const EdgeInsets.only(
                                  left: 25, top: 15, right: 25),
                              child: AppTextField(
                                textEditingController: loginScreenViewModel!.password,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 9, right: 13, bottom: 9, left: 13),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: Color(0xFFFEAFAF1),
                                          borderRadius:
                                              BorderRadius.circular(3)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: SvgPicture.asset(
                                            ImageResources.passwordIcon),
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
                              child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Forgot password?",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 13,
                                    ),
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25,top: 15,right: 25),
                            child: CommonElevatedButton(
                              onPressed: () async {

                                setState(() {
                                  loginScreenViewModel!.checkStatus = true;
                                });

                                String? deviceToken = await loginScreenViewModel!.firebaseMessaging.getToken();


                                Map<String ,dynamic> login = {
                                  "devicetoken": "${deviceToken}",
                                  "devicetype": '2',
                                  "email": "${loginScreenViewModel!.email.text}",
                                  "password": "${loginScreenViewModel!.password.text}",
                                  "userName": "",
                                  "facebookProfileUrl": "",
                                  "mobileVersion": "IOS",
                                  "osVersion": "10.11"
                                };


                                String loginBodyrespose = await RestService.postRestMethods(endPoint: '/api/v1/data/signin', bodyParam: login);

                                print("loginBodyespose --> ${loginBodyrespose}");
                                if(loginBodyrespose != null && loginBodyrespose.isNotEmpty){
                                  Map<String,dynamic> loginResponseMap = jsonDecode(loginBodyrespose);
                                  print("loginResponseMap ---> ${loginResponseMap.toString()}");

                                  String accessTokan =  await "${loginResponseMap['access_token']}";
                                  print('_______>______________ $accessTokan');

                                await SherdPref.setAccessTokan("access_token", "${loginResponseMap['access_token']}");


                                  loginScreenViewModel!.alertDilog(context,messge: loginResponseMap['Message']);




                                  if(loginResponseMap.containsKey('Success') && loginResponseMap['Success']){
                                    setState(() {
                                      loginScreenViewModel!.checkStatus = false;
                                    });

                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                      return FirstPage();
                                    },));



                                  }
                               // else {
                                  //
                                  //
                                  // }

                                }

                              },
                              textColor: Colors.white,
                              buttonColor: ColorsResources.registerScreen,
                              text: 'Login',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: divderrow(),
                          ),
                          facbookButton(),
                          appleButton(context),
                          registerAccount(context),

                          // conteryCode(context),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            loginScreenViewModel!.checkStatus ? Center(child: CircularProgressIndicator(color: ColorsResources.registerScreen),) : SizedBox(),
          ],
        ),
      )),
    );
  }
}
