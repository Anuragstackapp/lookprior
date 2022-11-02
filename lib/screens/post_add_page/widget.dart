import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lookprior/common/constant/color_const.dart';
import 'package:lookprior/screens/post_add_page/post_add_page.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../common/constant/string_const.dart';
import '../../common/widget/commaneText.dart';


class PostAddPageViewModel {
  final PostAddPageState postAddPageState;

  PostAddPageViewModel(this.postAddPageState);




  showModelButtomsSheetVideo(BuildContext context) {
    return showModalBottomSheet(
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
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SizedBox(
                height: 129,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () async {
                        Navigator.pop(context);
                        videoMethcamera(ImageSource.camera);
                      },
                      child: const CommonText(
                        text: StringResources.RecordVideo,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    const Divider(),
                    InkWell(
                      onTap: () async {
                        Navigator.pop(context);
                        videoMethcamera(ImageSource.gallery);
                      },
                      child: const CommonText(
                        text: StringResources.Choosefromlibrary,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    const Divider(),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const CommonText(
                        text: StringResources.Cancel,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.red,
                      ),
                    ),
                    const Divider(),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  showModelButtomsSheetPhoto(BuildContext context) {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          )),
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return SizedBox(
              height: 149,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () async {
                        Navigator.pop(context);
                        imageCameraMeth();

                      },
                      child: const CommonText(
                        text: StringResources.TakePhoto,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    const Divider(),
                    InkWell(
                      onTap: () async {
                        Navigator.pop(context);
                        imagegalleryMeth();
                      },
                      child: const CommonText(
                        text: StringResources.Choosefromlibrary,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    const Divider(),
                    InkWell(
                       onTap: () {
                         Navigator.pop(context);
                       },
                      child: const CommonText(
                        text: StringResources.Cancel,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.red,
                      ),
                    ),
                    const Divider(),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  videoMethcamera(ImageSource imageSource) async {
    try {
      XFile? video = await ImagePicker().pickVideo(
          source: imageSource, maxDuration: const Duration(seconds: 10));
      if (video == null) return;
      print('pick viedo');
      postAddPageState.videopath.add(video);
      postAddPageState.setState(() {});
    } on PlatformException catch (e) {

        print('Failed to pick video: $e');

    }
  }


  imageCameraMeth() async {

    try{
      final ImagePicker _picker = ImagePicker();

      final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
      if(photo == null) {
        return photo;
      }

      postAddPageState.photoPath.add(photo);
      postAddPageState.setState(() {});
    }on PlatformException catch (e) {
      print('image error camera ---> ${e}');
    }



  }
  imagegalleryMeth() async {

    try{
      final ImagePicker _picker = ImagePicker();
      List<XFile>? images1;

      final List<XFile>? images = await _picker.pickMultiImage();

          images1 = images;
          postAddPageState.photoPath.addAll(images1!);


      postAddPageState.setState(() {}) ;
    }on PlatformException catch (e) {
      print('image error camera ---> ${e}');
    }



  }

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




  Future<String?> videoThumbnail(int index) async {
    final fileName = await VideoThumbnail.thumbnailFile(
      video: postAddPageState.videopath[index]!.path,
      imageFormat: ImageFormat.JPEG,
      maxWidth: 80,
      maxHeight: 80,// specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
      quality: 100,
    );

    return fileName;
  }



}
