import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lookprior/screens/password_chang_page/password_change_page.dart';
import 'package:lookprior/screens/profile_edit_page/profile_edit_page.dart';
import 'package:lookprior/screens/profile_page/post_ad_view_page/post_ad_view_page.dart';
import 'package:lookprior/screens/profile_page/post_help_page/post_help_page.dart';
import 'package:lookprior/screens/profile_page/profile_page_view_model.dart';

import '../../app/shared_preference.dart';
import '../../common/constant/color_const.dart';
import '../../common/constant/image_const.dart';
import '../../common/widget/commaneText.dart';
import '../../service/rest_service.dart';
import '../bootambar/bottambarpage.dart';
import '../get_data/get_user_data_model.dart';

// ignore: must_be_immutable
class ProfilePage extends StatefulWidget {
  GlobalKey<ScaffoldState>? scaffoldState;

  ProfilePage({super.key, this.scaffoldState});

  @override
  State<ProfilePage> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  final Widget svg = SvgPicture.asset(ImageResources.profileuser);
  bool statusPgae = false;
  dynamic tokan;
  GetData? getData;

  // ignore: non_constant_identifier_names
  String? Username;
  bool user = false;

  ProfilePageViewModel? profilePageViewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }

  Future<GetData?> getUserData() async {
    tokan = await SherdPref.getAccessTokan();
    print("User Dtata Tokan ==> $tokan");
    dynamic userResponce = await GetRestService.getRestMethods(
        endPoint: '/api/v1/data/getprofiledetail',
        headers: {'Authorization': 'Bearer $tokan'});
    print('Rsponce == > $userResponce');

    getData = getDataFromJson(userResponce);
    print("User My Data == > $getData");
    if (getData!.success == true) {
      setState(() {
        Username = getData!.userName;
        user = true;
      });
      print("User Name === > $Username");
    }
    return null;
  }

  Future<bool> goback() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return  BottambarPage();
      },
    ));

    // ignore: null_argument_to_non_null_type
    return Future.value();
  }

  @override
  Widget build(BuildContext context) {
    profilePageViewModel = (profilePageViewModel ?? ProfilePageViewModel(this));

    return user
        ? WillPopScope(
            onWillPop: goback,
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: ColorsResources.registerScreen,
                elevation: 0,
                leading: InkWell(
                  onTap: () {
                    print("true");
                    widget.scaffoldState!.currentState!.openDrawer();
                    setState(() {});
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SvgPicture.asset(ImageResources.drawerIcon),
                  ),
                ),
                title: const Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 45),
                    child: Text("Profile"),
                  ),
                ),
                actions: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 15, left: 15, bottom: 15),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const ProfileEditPage();
                          },
                        ));
                      },
                      child: SvgPicture.asset(ImageResources.editicon,
                          height: 37, width: 20),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          topRight: Radius.circular(25.0),
                        )),
                        context: context,
                        builder: (context) {
                          return StatefulBuilder(
                            builder: (context, setState) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: SizedBox(
                                  height: 70,
                                  child: Column(
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          Navigator.pop(context);
                                          showDialog(
                                            barrierDismissible: false,
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                content: Text(
                                                    "Are you sure you want to log out?",
                                                    overflow: TextOverflow.fade,
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    )),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () async {
                                                        await SherdPref
                                                            .removeAccessTokan();
                                                        // ignore: use_build_context_synchronously
                                                        Navigator.pushReplacement(
                                                            context,
                                                            MaterialPageRoute(
                                                          builder: (context) {
                                                            return  BottambarPage();
                                                          },
                                                        ));
                                                      },
                                                      child: Text(
                                                        "Yes",
                                                        style: GoogleFonts.poppins(
                                                            color: ColorsResources
                                                                .registerScreen,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      )),
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                        "No",
                                                        style: GoogleFonts.poppins(
                                                            color: ColorsResources
                                                                .registerScreen,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      )),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        child: const CommonText(
                                          text: 'Logout',
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const Divider(color: Colors.black),
                                      InkWell(
                                        onTap: () async {
                                          Navigator.pop(context);
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                            builder: (context) {
                                              return const PasswordChangPage();
                                            },
                                          ));
                                        },
                                        child: const CommonText(
                                          text: 'Change Password',
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.more_vert_outlined,
                    ),
                  )
                ],
              ),
              body: statusPgae
                  ? PostHelpPage()
                  : Stack(
                      children: [
                        Container(
                          height: 200,
                          width: double.infinity,
                          color: ColorsResources.registerScreen,
                        ),
                        ListView(
                          children: [
                            Stack(
                              children: [
                                Align(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 60),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30),
                                            topRight: Radius.circular(30)),
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 35),
                                            child: Text("${getData!.userName}",
                                                style: GoogleFonts.poppins(
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 3),
                                            child: Text("Owner",
                                                style: GoogleFonts.poppins(
                                                  color: Colors.grey,
                                                )),
                                          ),
                                          SizedBox(
                                            width: double.infinity,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Card(
                                                elevation: 4,
                                                child:
                                                    profilePageViewModel!
                                                            .adsStatus
                                                        ? Column(
                                                            children: [
                                                              ListView.builder(
                                                                shrinkWrap:
                                                                    true,
                                                                physics:
                                                                    const ClampingScrollPhysics(),
                                                                itemCount: profilePageViewModel!.getAds!.filteredAddList!.length,
                                                                itemBuilder:
                                                                    (context, index) {
                                                                  return Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            10,
                                                                        right:
                                                                            10,
                                                                        top:
                                                                            10),
                                                                    child:
                                                                        SizedBox(
                                                                      height:
                                                                          80,
                                                                      child:
                                                                          InkWell(
                                                                            onTap: () {
                                                                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                                                                return const PostAdViewPage();
                                                                              },));
                                                                            },
                                                                            child: Card(
                                                                        child:
                                                                              Row(
                                                                            children: [
                                                                              profilePageViewModel!.getAds!.filteredAddList![index].adImageThumb!.isNotEmpty
                                                                                  ? Padding(
                                                                                      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                                                                                      child: Container(
                                                                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), image: DecorationImage(image: NetworkImage("${profilePageViewModel!.getAds!.filteredAddList![index].adImageThumb}"), fit: BoxFit.fill)),
                                                                                        height: 70,
                                                                                        width: 70,
                                                                                      ),
                                                                                    )
                                                                                  : Padding(
                                                                                      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                                                                                      child: Container(
                                                                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), image: DecorationImage(image: NetworkImage("${profilePageViewModel!.getAds!.filteredAddList![index].adVideoThumb}"), fit: BoxFit.fill)),
                                                                                        height: 70,
                                                                                        width: 70,
                                                                                      ),
                                                                                    ),
                                                                              Padding(
                                                                                padding: const EdgeInsets.only(left: 10),
                                                                                child: SizedBox(

                                                                                  child: Column(
                                                                                    children:  [
                                                                                      Padding(
                                                                                        padding: const EdgeInsets.only(top: 10),
                                                                                        child: Text("${profilePageViewModel!.getAds!.filteredAddList![index].title}",overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins(
                                                                                          color: Colors.black,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontSize: 11
                                                                                        )),
                                                                                      ),

                                                                                      Padding(
                                                                                        padding: const EdgeInsets.only(top: 4),
                                                                                        child: Text("\$${profilePageViewModel!.getAds!.filteredAddList![index].amount}",overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins(
                                                                                            color: Colors.black,
                                                                                            fontSize: 11
                                                                                        )),
                                                                                      ),


                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              const Spacer(),
                                                                              Padding(
                                                                                padding: const EdgeInsets.only(right: 10),
                                                                                child: Container(
                                                                                  height: 27,
                                                                                  alignment: Alignment.center,
                                                                                  decoration: BoxDecoration(color: Colors.grey.shade400, borderRadius: BorderRadius.circular(6)),
                                                                                  child: Container(
                                                                                      alignment: Alignment.center,
                                                                                      width: 90,
                                                                                      child: SvgPicture.asset(
                                                                                        ImageResources.share,
                                                                                        height: 40,
                                                                                      )),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                        ),
                                                                      ),
                                                                          ),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                              profilePageViewModel!
                                                                      .animatinloder
                                                                  ? Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          top:
                                                                              5),
                                                                      child: CircularProgressIndicator(
                                                                          color:
                                                                              ColorsResources.registerScreen),
                                                                    )
                                                                  : const SizedBox(),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        bottom:
                                                                            15),
                                                                child:
                                                                    TextButton(
                                                                        onPressed:
                                                                            () {
                                                                          setState(
                                                                              () {
                                                                            profilePageViewModel!.animatinloder =
                                                                                true;
                                                                            profilePageViewModel!.i =
                                                                                profilePageViewModel!.i + 10;
                                                                          });
                                                                          profilePageViewModel!
                                                                              .getUserAds()
                                                                              .then(
                                                                            (value) {
                                                                              setState(() {
                                                                                profilePageViewModel!.animatinloder = false;
                                                                              });
                                                                            },
                                                                          );
                                                                        },
                                                                        child:
                                                                            Text(
                                                                          "view all",
                                                                          style:
                                                                              GoogleFonts.poppins(color: ColorsResources.registerScreen),
                                                                        )),
                                                              ),
                                                            ],
                                                          )
                                                        : Column(
                                                            children: [
                                                              Padding(
                                                                padding: const EdgeInsets.only(
                                                                        left: 45,
                                                                        right: 45, top: 30),
                                                                child: ElevatedButton(
                                                                        style: ButtonStyle(
                                                                          backgroundColor:
                                                                              MaterialStateProperty.all(Colors.deepPurple),
                                                                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                                                                        ),
                                                                        onPressed:
                                                                            () {
                                                                          setState(
                                                                              () {
                                                                            statusPgae = true;
                                                                          });
                                                                        },
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: const [
                                                                            Icon(Icons.upload),
                                                                            SizedBox(width: 4),
                                                                            Text("Post an Ad")
                                                                          ],
                                                                        )),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            45,
                                                                        right:
                                                                            45,
                                                                        top:
                                                                            10),
                                                                child:
                                                                    OutlinedButton(
                                                                        style: OutlinedButton
                                                                            .styleFrom(
                                                                          side:
                                                                              const BorderSide(color: Colors.deepPurple),
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8),
                                                                          ),
                                                                        ),
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.pushReplacement(
                                                                              context,
                                                                              MaterialPageRoute(
                                                                            builder:
                                                                                (context) {
                                                                              return  BottambarPage();
                                                                            },
                                                                          ));
                                                                        },
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            const Icon(Icons.search,
                                                                                color: Colors.black),
                                                                            const SizedBox(width: 4),
                                                                            Text(
                                                                              "Browse",
                                                                              style: GoogleFonts.poppins(
                                                                                color: Colors.black,
                                                                              ),
                                                                            )
                                                                          ],
                                                                        )),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            45,
                                                                        right:
                                                                            45,
                                                                        top: 10,
                                                                        bottom:
                                                                            25),
                                                                child:
                                                                    ElevatedButton(
                                                                        style:
                                                                            ButtonStyle(
                                                                          backgroundColor:
                                                                              MaterialStateProperty.all(ColorsResources.registerScreen),
                                                                          shape:
                                                                              MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                                                                        ),
                                                                        onPressed:
                                                                            () {},
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: const [
                                                                            Icon(Icons.add_business_outlined),
                                                                            SizedBox(width: 4),
                                                                            Text("Add a Business")
                                                                          ],
                                                                        )),
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
                                const Align(
                                  alignment: Alignment.topCenter,
                                  child: CircleAvatar(
                                    radius: 50.0,
                                    backgroundColor: Colors.white,
                                    backgroundImage: AssetImage(
                                      ImageResources.profileuser,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
            ))
        : Container(
            color: Colors.transparent,
            child: Center(
                child: CircularProgressIndicator(
                    color: ColorsResources.registerScreen)),
          );
  }
}
