import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/constant/color_const.dart';
import '../../common/constant/image_const.dart';

class MessagePage extends StatefulWidget {
  GlobalKey<ScaffoldState>? scaffoldState;
  MessagePage({this.scaffoldState});



  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
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
          child:Padding(
            padding: const EdgeInsets.all(15.0),
            child: SvgPicture.asset(ImageResources.drawerIcon),
          )),
        title: Center(child: Padding(
          padding: const EdgeInsets.only(right: 40),
          child: Text("Messge"),
        )),


      ),
      // body: Center(
      //   child: Container(height: 100,width: 100,
      //   color: Colors.green,
      //   child: Text("Message page"),),
      // ),
    );
  }
}
