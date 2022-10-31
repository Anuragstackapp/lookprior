import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lookprior/common/constant/image_const.dart';
import 'package:lookprior/screens/post_add_page/post_add_page.dart';
import '../../../app/shared_preference.dart';
import '../../../common/constant/color_const.dart';
import '../../../common/widget/commane_scroll_behavior.dart';

class PostHelpPage extends StatefulWidget {
  GlobalKey<ScaffoldState>? scaffoldState;

  PostHelpPage({super.key, this.scaffoldState});

  @override
  State<PostHelpPage> createState() => _PostHelpPageState();
}

class _PostHelpPageState extends State<PostHelpPage> {



  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: ColorsResources.registerScreen,
      child: Stack(
        children: [
          Align(
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35)),
                ),
                child: ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Text("How to Post Your Ads",style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15,right: 10,left: 10),
                            child: Container(
                              width: double.infinity,
                              child: Card(
                                elevation: 3,
                                child: Column(
                                  children: [
                                   Padding(
                                     padding: const EdgeInsets.only(top: 10,left: 130,right: 130),
                                     child: Image.asset(ImageResources.recordPhone),
                                   ),
                                    Text("Record it with your phone",style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                    ),),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10,left: 85,right: 85),
                                      child: Image.asset(ImageResources.takePhoto),
                                    ),
                                    Text("Take a photo of it",style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                    ),),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10,left: 110,right: 110),
                                      child: Image.asset(ImageResources.meetBuyers),
                                    ),
                                    Text("Meet Buyers",style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                    ),),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10,left: 125,right: 125),
                                      child: Image.asset(ImageResources.makeMoney),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 15),
                                      child: Text("Make Money",style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                      ),),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 45, right: 45, top: 10,bottom: 40),
                            child: ElevatedButton(
                                style: ButtonStyle(

                                  backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8)
                                      )
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return const PostAddPage();
                                  },));
                                },
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.upload),
                                    SizedBox(width: 4),
                                    Text("Post Now")
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
