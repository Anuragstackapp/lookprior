import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lookprior/common/constant/color_const.dart';

import '../../common/constant/image_const.dart';

class LikePage extends StatefulWidget {
  GlobalKey<ScaffoldState>? scaffoldState;
  LikePage({this.scaffoldState});



  @override
  State<LikePage> createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: ColorsResources.registerScreen,
        elevation: 0,
        leading:InkWell(
            onTap: () {
              print("true");
              widget.scaffoldState!.currentState!.openDrawer();
              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SvgPicture.asset(ImageResources.drawerIcon),
            )) ,
        title: Center(child: Padding(
          padding: const EdgeInsets.only(right: 40),
          child: Text("Like Page"),
        ),),

      ),

    );
  }
}
