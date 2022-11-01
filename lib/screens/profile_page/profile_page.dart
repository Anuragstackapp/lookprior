import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lookprior/screens/password_chang_page/password_change_page.dart';
import 'package:lookprior/screens/profile_edit_page/profile_edit_page.dart';
import 'package:lookprior/screens/profile_page/post_help_page/post_help_page.dart';

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
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final Widget svg = SvgPicture.asset(ImageResources.profileuser);
  bool statusPgae = false;
  dynamic tokan;
  GetData? getData;
  // ignore: non_constant_identifier_names
  String? Username;
  bool user = false;


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
        return const BottambarPage();
      },
    ));

    // ignore: null_argument_to_non_null_type
    return Future.value();
  }

  @override
  Widget build(BuildContext context) {
    return user
        ? WillPopScope(
            onWillPop: goback,
            child: Scaffold(
              backgroundColor: ColorsResources.registerScreen,
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return ProfileEditPage();
                        },));
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
                                            context: context, builder: (context) {
                                            return AlertDialog(
                                              content: Text("Are you sure you want to log out?",
                                                  overflow: TextOverflow.fade,
                                                  style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                              )),
                                              actions: [
                                                TextButton(onPressed: () async {
                                                  await SherdPref.removeAccessTokan();
                                                  // ignore: use_build_context_synchronously
                                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                                    return const BottambarPage();
                                                  },));
                                                }, child: Text("Yes",style: GoogleFonts.poppins(
                                                  color: ColorsResources.registerScreen,
                                                  fontWeight: FontWeight.w400
                                                ),)),
                                                TextButton(onPressed: () {
                                                  Navigator.pop(context);
                                                }, child: Text("No",style: GoogleFonts.poppins(
                                                    color: ColorsResources.registerScreen,
                                                    fontWeight: FontWeight.w400
                                                ),)),
                                              ],
                                            );
                                          },);
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
                                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                                          return const PasswordChangPage();
                                        },));

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
                  : Container(
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
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30)),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 35),
                                      child: Text("${getData!.userName}",
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 3),
                                      child: Text("Owner",
                                          style: GoogleFonts.poppins(
                                            color: Colors.grey,
                                          )),
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Card(
                                          elevation: 4,
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 45,
                                                    right: 45,
                                                    top: 30),
                                                child: ElevatedButton(
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(Colors
                                                                  .deepPurple),
                                                      shape: MaterialStateProperty.all(
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8))),
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        statusPgae = true;
                                                      });
                                                    },
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: const [
                                                        Icon(Icons.upload),
                                                        SizedBox(width: 4),
                                                        Text("Post an Ad")
                                                      ],
                                                    )),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 45,
                                                    right: 45,
                                                    top: 10),
                                                child: OutlinedButton(
                                                    style: OutlinedButton
                                                        .styleFrom(
                                                      side: const BorderSide(
                                                          color: Colors
                                                              .deepPurple),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.pushReplacement(
                                                          context,
                                                          MaterialPageRoute(
                                                        builder: (context) {
                                                          return const BottambarPage();
                                                        },
                                                      ));
                                                    },
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        const Icon(Icons.search,
                                                            color:
                                                                Colors.black),
                                                        const SizedBox(width: 4),
                                                        Text(
                                                          "Browse",
                                                          style: GoogleFonts
                                                              .poppins(
                                                            color: Colors.black,
                                                          ),
                                                        )
                                                      ],
                                                    )),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 45,
                                                    right: 45,
                                                    top: 10,
                                                    bottom: 25),
                                                child: ElevatedButton(
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(ColorsResources
                                                                  .registerScreen),
                                                      shape: MaterialStateProperty.all(
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8))),
                                                    ),
                                                    onPressed: () {},
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: const [
                                                        Icon(Icons
                                                            .add_business_outlined),
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
                      ),
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
