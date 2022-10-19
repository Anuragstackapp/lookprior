import 'package:flutter/material.dart';
import 'package:lookprior/common/constant/color_const.dart';

class LikePage extends StatefulWidget {
  const LikePage({Key? key}) : super(key: key);

  @override
  State<LikePage> createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Like Page")),backgroundColor: ColorsResources.registerScreen),
    // body: Center(
    //   child: Container(height: 100,width: 100,
    //   color: Colors.grey, child: const Text("like page")),
    // ),
    );
  }
}
