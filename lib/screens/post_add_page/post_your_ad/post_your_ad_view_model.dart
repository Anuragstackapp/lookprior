import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lookprior/common/constant/color_const.dart';
import 'package:lookprior/screens/post_add_page/post_your_ad/post_your_ad_description.dart';
import '../../../app/shared_preference.dart';
import 'package:http/http.dart' as http;

class PostYourAdViewModel{

  final PostYourAdDescriptionState postYourAdDescriptionState;
  dynamic tokan;
  dynamic data;
  bool status = false;


  PostYourAdViewModel(this.postYourAdDescriptionState);
  Future<bool?>  showToastMessage(message, color)
  {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: color,
        textColor:  Colors.white,
        fontSize: 16.0
    );
  }
  submitButton() async {
    tokan = await SherdPref.getAccessTokan();
    if(postYourAdDescriptionState.title.text.isEmpty){
      showToastMessage('Please Add Title', ColorsResources.registerScreen);
    }
    else if(postYourAdDescriptionState.amount.text.isEmpty){
      showToastMessage('Please Add Amount', ColorsResources.registerScreen);
    }else if(postYourAdDescriptionState.description.text.isEmpty){
      showToastMessage('Please Add Description', ColorsResources.registerScreen);
    }else{
      postYourAdDescriptionState.setState(() {
        status = true;
      });


      try {
        var headers = {
          'Authorization': 'Bearer $tokan'
        };
        var request = http.MultipartRequest('POST', Uri.parse('https://lookprstage.com/admin//api/v1/detail/AddOrUpdateAd2'));

        request.fields.addAll({
          'addDetailId': '',
          'servicePackId': '',
          'totalExposureDays': '',
          'perDayExposurePrice': '',
          'title': '${postYourAdDescriptionState.title}',
          'cityName': 'Surat',
          'stateName': 'Gujarat',
          'description': '${postYourAdDescriptionState.description}',
          'amount': '${postYourAdDescriptionState.amount}',
          'addType': '1',
          'categoryId': '1',
          'subCategoryId': '1',
          'suSubCategoryId': '0',
          'latitude': '21.1702401',
          'longitude': '72.8310607',
          'countryId': 'india',
          'distance': '150',
          'location': 'Surat, Gujarat, India',
          'broadCastAmount': '0.0',
          'currency': 'INR',
          'videoSize': '',
          'videoDuration': '',
          'adVideoList[0].videoSize': '10',
          'adVideoList[0].videoDuration': '8'
        });

        for (var i = 0; i < postYourAdDescriptionState.widget.photoPath.length; i++) {
          request.files.add(await http.MultipartFile.fromPath(
              'adImageList[0]', postYourAdDescriptionState.widget.photoPath[i]!.path));
          print("imgPath ===>${postYourAdDescriptionState.widget.photoPath[i]!.path}");
        }

        for (var i = 0; i < postYourAdDescriptionState.widget.videopath.length; i++) {
          request.files.add(await http.MultipartFile.fromPath(
              'adVideoList[0].adVideo',
              postYourAdDescriptionState.widget.videopath[i]!.path));
          print("video ====>${postYourAdDescriptionState.widget.videopath[i]!.path}");
        }
        request.headers.addAll(headers);
        http.StreamedResponse response = await request.send();

        if (response.statusCode == 200) {
          // print(await response.stream.bytesToString());
          data = await response.stream.bytesToString();
          Map<String, dynamic> responseMaps = jsonDecode(data);
          print("responseMaps === > ${responseMaps.containsKey('Success')}");
          if(responseMaps.containsKey('Success') && responseMaps['Success']){
            print("responseMaps === > ${responseMaps.containsKey('Success')}");
            status = false;
            postYourAdDescriptionState.setState(() {

            });
            showToastMessage('${responseMaps['Message']}', ColorsResources.registerScreen);

          }else{
            status = false;
            postYourAdDescriptionState.setState(() {

            });
            showToastMessage('${responseMaps['Message']}', ColorsResources.registerScreen);


          }

        }
        else {
          print(response.reasonPhrase);
        }
      } catch (e) {
        // TODO
        postYourAdDescriptionState.setState(() {
          status = false;
        });
        print("error ==>$e");
      }
    }

  }

}