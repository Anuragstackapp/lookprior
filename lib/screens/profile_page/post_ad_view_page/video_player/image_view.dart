import 'package:flutter/material.dart';

class ImageViewAds extends StatefulWidget {
  String? videoAndImageLink;
  ImageViewAds({this.videoAndImageLink});



  @override
  State<ImageViewAds> createState() => _ImageViewAdsState();
}

class _ImageViewAdsState extends State<ImageViewAds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.network("${widget.videoAndImageLink}",fit: BoxFit.fill),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10,right: 5),
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(onPressed: () {
                Navigator.pop(context);

              }, icon: const Icon(Icons.highlight_remove_sharp,color: Colors.white,size: 35)),
            ),
          ),
        ],
      ),
    );
  }
}
