import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lookprior/screens/bootambar/bottambarpage.dart';
import 'package:lookprior/screens/profile_page/post_ad_view_page/post_ad_view_page.dart';
import 'package:lookprior/service/rest_service.dart';

import '../../../app/shared_preference.dart';
import 'model/broadcast_detail_model.dart';

class PostAdViewPageViewModel{

  final PostAdViewPageState postAdViewPageState;
  dynamic tokan;
  GetBroadCastDetail? getBroadCastDetail;
  bool adDataStatus = false;
  List<String> videoAndImageLink = [];
  PageController pageController = PageController();
  int cnt = 0;

  PostAdViewPageViewModel(this.postAdViewPageState){
    getUserAdsData();
    pageController = PageController(initialPage: cnt);
  }

  Future<GetBroadCastDetail?> getUserAdsData() async {
    postAdViewPageState.setState(() {
      adDataStatus = true;
    });

    tokan = await SherdPref.getAccessTokan();

    dynamic userResponceAdsData = await GetRestService.getRestMethods(
        endPoint: '/api/v1/detail/getbroadcastdetailnew?broadCastId=${postAdViewPageState.widget.broadCastId}&res=true',
        headers: {'Authorization': 'Bearer $tokan'},
        );

    print("User Ads Tokan ==> $tokan");
    print('Rsponce Ads == > $userResponceAdsData');
    getBroadCastDetail = getBroadCastDetailFromJson(userResponceAdsData);

    print('Rsponce Ads Data == > ${getBroadCastDetail!.adImage!.length}');

    if (getBroadCastDetail!.success == true) {

      for(int i =0; i<getBroadCastDetail!.adVideo!.length;i++){
        videoAndImageLink.add("${getBroadCastDetail!.adVideo![i].videoThumb}");
        print("Video Link ===> ${getBroadCastDetail!.adVideo![i].videoThumb}");

      }

      for(int i =0; i<getBroadCastDetail!.adImage!.length;i++){
        videoAndImageLink.add("${getBroadCastDetail!.adImage![i].image}");
        print("Image Link ===> ${getBroadCastDetail!.adImage![i].image}");

      }

      print("List Image and Video ===> ${videoAndImageLink.length}");
      postAdViewPageState.setState(() {
        adDataStatus = false;
      });
      postAdViewPageState.setState(() {});
    }
    return null;
  }
  
  deleteAds(BuildContext context){

    var id = postAdViewPageState.widget.adDetailid;
    dynamic deleteResponce  = GetRestService.getRestMethods(endPoint: '/api/v1/detail/DeleteAdByAdmin?addDetailId=$id');

    print("Deleate ok");
    if(deleteResponce != null && deleteResponce.isNotEmpty){
      Map<String , dynamic> deleteResopnseMap = jsonDecode(deleteResponce);
      if(deleteResopnseMap.containsKey('Success')){
        print("Deleate ok");
        postAdViewPageState.setState(() {

        });
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return BottambarPage(i: 3);
        },));
        SnackBar(content: Text("${deleteResopnseMap['Message']}"));

        
      }
    }
  

  }

}