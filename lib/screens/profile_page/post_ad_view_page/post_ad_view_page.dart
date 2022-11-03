import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lookprior/common/constant/image_const.dart';

import '../../../common/constant/color_const.dart';

class PostAdViewPage extends StatefulWidget {
  const PostAdViewPage({Key? key}) : super(key: key);

  @override
  State<PostAdViewPage> createState() => _PostAdViewPageState();
}

class _PostAdViewPageState extends State<PostAdViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ListView(
            children: [
              Stack(
                children: [
                  Container(
                    height: 250,
                    width: double.infinity,
                    color: ColorsResources.registerScreen,
                    child: Image.asset(ImageResources.demoPostAdsView,fit: BoxFit.fill),
                  ),
                  Align(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 180),
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 13,left: 13),
                                child: Row(
                                  children: [
                                    Text("Image Title",style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500
                                    )),
                                    Spacer(),
                                    Text("\$123",style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        color: ColorsResources.registerScreen,
                                    )),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10,top: 8),
                                child: Row(children: [
                                  Icon(Icons.location_on,size: 16,color: Colors.grey),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(" Gujrat,India",style: GoogleFonts.poppins(
                                      color: Colors.grey,
                                    ),),
                                  )
                                ],),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8,left: 13),
                                  child: Text("Images",style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500
                                  )),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding:  EdgeInsets.only(left: 13,top: 8),
                                  child: Container(height: 100,width: 100,

                                    decoration: BoxDecoration(
                                     image: DecorationImage(image: AssetImage(ImageResources.demoPostAdsView),fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(8)
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8,left: 13),
                                  child: Text("Description",style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500
                                  )),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 2,left: 16),
                                  child: Text("Description",style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: Colors.grey
                                  )),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8,left: 13),
                                  child: Text("Similer ads",style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      color: Colors.black,
                                    fontWeight: FontWeight.w500
                                  )),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 50,right: 50,),
                                child: Image.asset(ImageResources.similerAds),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8,left: 13,bottom: 20),
                                child: Text("No similar ads yet!",style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500
                                )),
                              ),




                            ],
                          ),
                        ),
                      ),
                    ),
                  ),



                ],
              )
            ],
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: IconButton(onPressed: () {
                Navigator.pop(context);
              }, icon: Icon(
                Icons.arrow_circle_left,color: Colors.grey,
                size: 35,
              ),),
            ),
          )
        ],
      ),
    );
  }
}
