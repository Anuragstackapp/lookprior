import 'dart:io';

import 'package:flutter/material.dart';

import '../../common/constant/color_const.dart';

class ImageViewPage extends StatefulWidget {
  String path;
  ImageViewPage(this.path);



  @override
  State<ImageViewPage> createState() => _ImageViewPageState();
}

class _ImageViewPageState extends State<ImageViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image View"),
        backgroundColor: ColorsResources.registerScreen,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20,top: 50,bottom: 30),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(image: FileImage(File(widget.path)),fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
    );
  }
}
