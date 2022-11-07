import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lookprior/common/constant/image_const.dart';
import 'package:lookprior/common/widget/commane_scroll_behavior.dart';
import 'package:lookprior/screens/profile_page/post_ad_view_page/post_ad_view_page_view_model.dart';
import '../../../common/constant/color_const.dart';

class PostAdViewPage extends StatefulWidget {
  num? broadCastId;
  num? adDetailid;
  PostAdViewPage({super.key, this.broadCastId,this.adDetailid});



  @override
  State<PostAdViewPage> createState() => PostAdViewPageState();
}

class PostAdViewPageState extends State<PostAdViewPage> {
  PostAdViewPageViewModel? postAdViewPageViewModel;

  @override
  Widget build(BuildContext context) {

    postAdViewPageViewModel ?? (postAdViewPageViewModel = PostAdViewPageViewModel(this));

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ScrollConfiguration(
            behavior: MyBehavior(),
            child: ListView(
              children: [
              postAdViewPageViewModel!.getBroadCastDetail != null ?  Stack(
                  children: [

                    // Container(
                    //   margin: EdgeInsets.all(8.0),
                    //   child: ClipRRect(
                    //     borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    //     child: Image.network(
                    //         url,
                    //         fit: BoxFit.cover,
                    //         width: 1000.0
                    //     ),
                    //   ),
                    // ),
                    //                CarouselSlider.builder(itemCount: postAdViewPageViewModel!.videoAndImageLink.length, itemBuilder: (context, index, realIndex) {
                    //
                    //                  return Container(
                    //
                    //                      height: 250,
                    //                      width: double.infinity,
                    //                      child: Image.network(postAdViewPageViewModel!.videoAndImageLink[index],width: double.infinity,height: double.infinity,fit: BoxFit.fill,));
                    //
                    //                }, options: CarouselOptions(
                    //
                    //                  autoPlay: false,
                    //                  enableInfiniteScroll: false,
                    //
                    //                )),

                    postAdViewPageViewModel!.videoAndImageLink.isNotEmpty ?    Stack(
                      children: [
                        SizedBox(
                          height: 250,
                          child: PageView.builder(
                            onPageChanged: (value) {
                              postAdViewPageViewModel!.cnt = value;
                              setState(() {

                              });
                            },
                            controller: postAdViewPageViewModel!.pageController,
                            itemCount: postAdViewPageViewModel!.videoAndImageLink.length,
                            itemBuilder: (context, index) {
                              return   postAdViewPageViewModel!.videoAndImageLink[index].containsKey("video") ? Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(image: NetworkImage("${postAdViewPageViewModel!.videoAndImageLink[index]["video"]}"),fit: BoxFit.fill,),
                                ),
                                child: Center(
                                  child: IconButton(onPressed: () {

                                  }, icon: const Icon(Icons.play_circle_fill_rounded,color: Colors.white,size: 30,)),
                                ),
                              ) : Container(decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("${postAdViewPageViewModel!.videoAndImageLink[index]["image"]}"))),);
                          },),
                        ),

                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding:
                            const EdgeInsets.only(right: 10),
                            child: Container(
                                height: 35,
                                width: 35,
                                decoration: const BoxDecoration(
                                    color: Colors.grey,
                                    shape: BoxShape.circle),
                                child: PopupMenuButton(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.only(
                                          topLeft:
                                          Radius.circular(
                                              15),
                                          bottomLeft:
                                          Radius.circular(
                                              15),
                                          bottomRight:
                                          Radius.circular(
                                              15))),
                                  position:
                                  PopupMenuPosition.under,
                                  offset: const Offset(-15,-5),
                                  child: const Icon(
                                      Icons.more_horiz,
                                      color: Colors.white,
                                      size: 20),
                                  onSelected: (value) {
                                   value = postAdViewPageViewModel!.deleteAds(context);
                                  },
                                  itemBuilder: (BuildContext bc) {
                                    return const [
                                      PopupMenuItem(
                                        value: '/hello',
                                        child: Text("Edit"),
                                      ),
                                      PopupMenuItem(
                                        value: '/about',
                                        child: Text("Delate"),
                                      ),
                                    ];
                                  },
                                )),
                          ),
                        ),
                        //  Padding(
                        //   padding: const EdgeInsets.all(10),
                        //   child: Align(
                        //     alignment: Alignment.topRight,
                        //     child: InkWell(
                        //       onTap: () {
                        //
                        //       },
                        //       child: const CircleAvatar(
                        //         radius: 16,
                        //         backgroundColor: Colors.grey,
                        //         child: Icon(
                        //           Icons.more_horiz_rounded,
                        //           color: Colors.white,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // )
                      ],
                    ) : Center(child: CircularProgressIndicator(color: ColorsResources.registerScreen)),

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
                            padding: const EdgeInsets.only(top: 25),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 13,left: 13),
                                  child: Row(
                                    children: [
                                      postAdViewPageViewModel!.getBroadCastDetail!.title!.isNotEmpty ?  Text("${postAdViewPageViewModel!.getBroadCastDetail!.title}",style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500
                                      )) : const Text(""),
                                      const Spacer(),
                                      postAdViewPageViewModel!.getBroadCastDetail!.amount != null ? Text("\$${postAdViewPageViewModel!.getBroadCastDetail!.amount}",style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          color: ColorsResources.registerScreen,
                                      )) : const Text(""),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10,top: 8),
                                  child: Row(children: [
                                    const Icon(Icons.location_on,size: 16,color: Colors.grey),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child:postAdViewPageViewModel!.getBroadCastDetail!.location!.isNotEmpty ?  Text("${postAdViewPageViewModel!.getBroadCastDetail!.location}",style: GoogleFonts.poppins(
                                        color: Colors.grey,
                                      ),):const Text(""),
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
                                postAdViewPageViewModel!.videoAndImageLink.isNotEmpty ?   Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding:  const EdgeInsets.only(left: 13,top: 8,right: 13),
                                    child: SizedBox(
                                      height: 75,
                                      child: ListView.separated(

                                        separatorBuilder:
                                            (context, index) {
                                          return const SizedBox(
                                            width: 10,
                                          );
                                        },
                                        scrollDirection: Axis.horizontal,
                                        itemCount: postAdViewPageViewModel!.videoAndImageLink.length,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              setState(() {
                                                postAdViewPageViewModel!.cnt = index;
                                                postAdViewPageViewModel!.pageController.jumpToPage(postAdViewPageViewModel!.cnt);
                                              });
                                            },
                                            child: Container(
                                              height: 60,
                                              width: 75,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(
                                                          5)),
                                                  image: DecorationImage(
                                                      image: NetworkImage(postAdViewPageViewModel!.videoAndImageLink[index].containsKey("image") ?  "${postAdViewPageViewModel!.videoAndImageLink[index]["image"]}" : "${postAdViewPageViewModel!.videoAndImageLink[index]["video"]}"), fit: BoxFit.fill)),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ) : Center(child: CircularProgressIndicator(color: ColorsResources.registerScreen)),
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
                                    child: postAdViewPageViewModel!.getBroadCastDetail!.description!.isNotEmpty ? Text("${postAdViewPageViewModel!.getBroadCastDetail!.description}",overflow: TextOverflow.fade,style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        color: Colors.grey
                                    )) : Text("",overflow: TextOverflow.fade,style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        color: Colors.grey
                                    )),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8,left: 13),
                                    child: Text("Similar ads",style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        color: Colors.black,
                                      fontWeight: FontWeight.w500
                                    )),
                                  ),
                                ),

                                postAdViewPageViewModel!.getBroadCastDetail!.similarAddList!.isNotEmpty?   ListView.builder(
                                  shrinkWrap: true,
                                  physics: const ClampingScrollPhysics(),
                                  itemCount: postAdViewPageViewModel!.getBroadCastDetail!.similarAddList!.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(left: 10,right: 10, top: 10),
                                      child: SizedBox(
                                        height: 165,
                                        child: InkWell(
                                          onTap: () {

                                          },
                                          child: Card(

                                            child: Column(
                                              children: [
                                                postAdViewPageViewModel!.getBroadCastDetail!.similarAddList![index].adImageThumb!.isNotEmpty
                                                    ? Padding( padding: const EdgeInsets.only(bottom: 5),
                                                  child: Container(

                                                    decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),image: DecorationImage(image: NetworkImage("${ postAdViewPageViewModel!.getBroadCastDetail!.similarAddList![index].adImageThumb}"), fit: BoxFit.fill)),
                                                    height: 100,
                                                    width: double.infinity,
                                                  ),
                                                )
                                                    : Padding(
                                                  padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5,right: 10),
                                                  child: Container(
                                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), image: DecorationImage(image: NetworkImage("${postAdViewPageViewModel!.getBroadCastDetail!.similarAddList![index].adVideoThumb}"), fit: BoxFit.fill)),
                                                    height: 100,
                                                    width: double.infinity,
                                                  ),
                                                ),
                                                Row(children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 10),
                                                    child: Text("${postAdViewPageViewModel!.getBroadCastDetail!.similarAddList![index].title}"),
                                                  ),
                                                  const Spacer(),
                                                  Padding(
                                                    padding: const EdgeInsets.only(right: 10,top: 3),
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
                                                ],),
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 10),
                                                    child: Text("${postAdViewPageViewModel!.getBroadCastDetail!.similarAddList![index].amount}",style: GoogleFonts.poppins(
                                                        color: Colors.grey,fontSize: 10
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
                                ) : Column(children: [Padding(
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
                                ])
                              ,






                              ],
                            ),
                          ),
                        ),
                      ),
                    ),



                  ],
                ) : const SizedBox(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: IconButton(onPressed: () {
                Navigator.pop(context);
                // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                //   return BottambarPage(i: 3);
                // },));
              }, icon: const Icon(
                Icons.arrow_circle_left,color: Colors.grey,
                size: 35,
              ),),
            ),
          ),
          postAdViewPageViewModel!.adDataStatus ? Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black12,
            child:  Center(child: CircularProgressIndicator(color: ColorsResources.registerScreen)),

          ) : const SizedBox(),

        ],
      ),
    );
  }
}
