import 'package:flutter/material.dart';

import '../../common/constant/color_const.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Messge Page")),backgroundColor: ColorsResources.registerScreen),
      // body: Center(
      //   child: Container(height: 100,width: 100,
      //   color: Colors.green,
      //   child: Text("Message page"),),
      // ),
    );
  }
}
