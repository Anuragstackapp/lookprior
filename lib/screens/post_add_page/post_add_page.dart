import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lookprior/common/constant/color_const.dart';
import 'package:lookprior/screens/post_add_page/widget.dart';
import 'package:lookprior/screens/video_player_page/image_view.dart';
import 'package:lookprior/screens/video_player_page/video_player_page.dart';
import '../../common/constant/image_const.dart';
import '../../common/constant/string_const.dart';
import '../../common/widget/commaneText.dart';
import '../../common/widget/common_navigator.dart';
import '../../common/widget/elevated_button.dart';

class PostAddPage extends StatefulWidget {
  const PostAddPage({Key? key}) : super(key: key);

  @override
  State<PostAddPage> createState() => PostAddPageState();
}

class PostAddPageState extends State<PostAddPage> {
  PostAddPageViewModel? postAddPageViewModel;

  List<XFile?> videopath = [];
  List<XFile?> photoPath = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    postAddPageViewModel ?? (postAddPageViewModel = PostAddPageViewModel(this));
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: double.infinity,
        width: double.infinity,
        color: ColorsResources.registerScreen,
        child: Stack(
          children: [
            Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back_ios_new,
                                color: Colors.white)),
                      )),
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Text(
                            'Post your Ad',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            Align(
              child: Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            elevation: 3,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    leading: const CommonText(
                                      text: StringResources.Media,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                    trailing: SvgPicture.asset(
                                        ImageResources.infomationicon),
                                  ),
                                  const Divider(),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    child: CommonText(
                                      text: StringResources.videotext1,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    child: CommonText(
                                      text: StringResources.videorext2,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(children: [
                                        InkWell(
                                          onTap: () {
                                            print('dio');

                                            postAddPageViewModel!
                                                .showModelButtomsSheetVideo(
                                                    context);
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.only(),
                                            child: SizedBox(
                                              height: 109,
                                              width: 113,
                                              child: Stack(children: [
                                                SvgPicture.asset(
                                                    ImageResources.videoicon),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 19, top: 62),
                                                  child: CommonText(
                                                    text: StringResources
                                                        .AddVideos,
                                                    color: ColorsResources
                                                        .registerScreen,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ]),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 120,
                                          width: 300,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: videopath.length,
                                            itemBuilder: (context, index) {
                                              return Row(
                                                children: [
                                                  Stack(children: [
                                                    FutureBuilder<String?>(
                                                      future:
                                                          postAddPageViewModel!
                                                              .videoThumbnail(
                                                                  index),
                                                      builder:
                                                          (context, snapshot) {
                                                        if (snapshot.data !=
                                                                null &&
                                                            snapshot.hasData) {
                                                          return InkWell(
                                                            onTap: () {
                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                builder:
                                                                    (context) {
                                                                  return VideoPlayerScreen(
                                                                      videopath[
                                                                              index]!
                                                                          .path);
                                                                },
                                                              ));
                                                            },
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Container(
                                                                  height: 120,
                                                                  width: 95,
                                                                  decoration: BoxDecoration(
                                                                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                                                                      image: DecorationImage(
                                                                          image: FileImage(
                                                                            File(snapshot.data!),
                                                                          ),
                                                                          fit: BoxFit.fill)),
                                                                  child: Icon(
                                                                    Icons
                                                                        .play_circle,
                                                                    color: ColorsResources
                                                                        .registerScreen,
                                                                  )),
                                                            ),
                                                          );
                                                        } else {
                                                          return const CircularProgressIndicator();
                                                        }
                                                      },
                                                    ),
                                                    IconButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            videopath.removeAt(
                                                                index);
                                                          });
                                                        },
                                                        icon: Icon(Icons
                                                            .remove_circle))
                                                  ]),
                                                ],
                                              );
                                            },
                                          ),
                                        ),
                                      ]),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                ]),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Container(
                            width: double.infinity,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              elevation: 3,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 15),
                                      child: CommonText(
                                        text: StringResources.imagetext1,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 15),
                                      child: CommonText(
                                        text: StringResources.imagetext2,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              postAddPageViewModel!
                                                  .showModelButtomsSheetPhoto(
                                                      context);
                                            },
                                            child: SizedBox(
                                              height: 109,
                                              width: 113,
                                              child: Stack(children: [
                                                SvgPicture.asset(
                                                    ImageResources.imageicon),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 19, top: 62),
                                                  child: CommonText(
                                                    text: StringResources
                                                        .AddPhotos,
                                                    color: ColorsResources
                                                        .registerScreen,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ]),
                                            ),
                                          ),
                                          photoPath.length > 0
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 10),
                                                  child: Container(
                                                    height: 110,
                                                    width: 200,
                                                    child: ListView.builder(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemCount:
                                                          photoPath.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return Container(
                                                          height: 100,
                                                          width: 100,
                                                          child: Row(
                                                            children: [
                                                              Stack(children: [
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 5,
                                                                      right: 5),
                                                                  child: InkWell(
                                                                      onTap:
                                                                          () {
                                                                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                                                                          return ImageViewPage(photoPath[index]!.path);
                                                                        },));
                                                                          },
                                                                      child: Image(
                                                                          image: FileImage(File(photoPath[index]!
                                                                              .path)),
                                                                          height:
                                                                              100,
                                                                          width:
                                                                              80,
                                                                          fit: BoxFit
                                                                              .fill)),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .topLeft,
                                                                  child: IconButton(
                                                                      onPressed: () {
                                                                        setState(
                                                                            () {
                                                                          photoPath
                                                                              .removeAt(index);
                                                                        });
                                                                      },
                                                                      icon: Icon(Icons.remove_circle),color: Colors.red),
                                                                )
                                                              ]),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                )
                                              : SizedBox(
                                                  height: 100, width: 100),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ]),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: CommonText(
                              text: StringResources.posttext,
                              color: Colors.black,
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CommonText(
                                  text: StringResources.Gotomyoptions,
                                  fontSize: 13,
                                  color: ColorsResources.registerScreen,
                                  fontWeight: FontWeight.w500,
                                ),
                                SvgPicture.asset(
                                  ImageResources.ArrowRight,
                                  height: 9,
                                  width: 8,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: CommonElevatedButton(
                              onPressed: () {
                                setState(() {});
                              },
                              buttonColor: ColorsResources.registerScreen,
                              textSize: 16,
                              text: StringResources.Next,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
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
