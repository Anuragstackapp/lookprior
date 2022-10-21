import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/constant/color_const.dart';
import '../../common/constant/image_const.dart';

class ProfilePage extends StatefulWidget {
  GlobalKey<ScaffoldState>? scaffoldState;
  ProfilePage({this.scaffoldState});



  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final Widget svg =  SvgPicture.asset(
    ImageResources.profileuser
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsResources.registerScreen,
      appBar:AppBar(
        backgroundColor: ColorsResources.registerScreen,
        elevation: 0,
        leading:InkWell(
            onTap: () {
              print("true");
              widget.scaffoldState!.currentState!.openDrawer();
              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SvgPicture.asset(ImageResources.drawerIcon),
            ),
            ) ,
        title: const Center(child: Padding(
          padding: EdgeInsets.only(left: 45),
          child: Text("Profile"),
        ),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15,left:15,bottom: 15),
            child: InkWell(
              onTap: () {

                // Navigator.push(context,
                //     CommonNavigator(child: const NotificationsPage()));
              },
              child: SvgPicture.asset(ImageResources.editicon,
                  height: 37, width: 20),
            ),
          ),
          IconButton(onPressed: () {
            
          }, icon: const Icon(
            Icons.more_vert_outlined,
          ),)
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: ColorsResources.registerScreen,
        child: Stack(
          children: [
            Align(
              child: Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child:Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 35),
                        child: Text("User Name",style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Text("Owner",style: GoogleFonts.poppins(
                          color: Colors.grey,
                        )),
                      ),
                      Container(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 4,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 45,right: 45,top: 30),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20)
                                    ),
                                    width: double.infinity,
                                    child: GFButton(
                                      color: Colors.deepPurple,
                                      onPressed: (){},
                                      text: "Post an Ad",
                                      icon: Icon(Icons.upload),
                                      size: GFSize.LARGE,
                                      borderSide: BorderSide(style:BorderStyle.solid),
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(left: 45,right: 45,top: 10),
                                  child: Container(
                                    width: double.infinity,
                                    child: GFButton(

                                      onPressed: (){},
                                      textColor: Colors.deepPurple,
                                      text: "Browse",
                                      icon: Icon(Icons.search),
                                      type: GFButtonType.outline2x,
                                      size: GFSize.MEDIUM,

                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 45,right: 45,top: 10,bottom: 25),
                                  child: Container(
                                    width: double.infinity,
                                    child: GFButton(
                                      color: ColorsResources.registerScreen,
                                      onPressed: (){},
                                      text: "Post an Ad",
                                      icon: Icon(Icons.add_business_outlined),
                                      size: GFSize.LARGE,
                                      borderSide: BorderSide(style:BorderStyle.solid),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage(ImageResources.profileuser,),

                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
