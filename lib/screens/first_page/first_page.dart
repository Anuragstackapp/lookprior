import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lookprior/screens/first_page/first_page_view_model.dart';
import 'package:lookprior/screens/first_page/first_page_widget.dart';

import '../../common/constant/color_const.dart';
import '../../common/constant/image_const.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => FirstPageState();
}

class FirstPageState extends State<FirstPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 0),() {
      alertDilog(context);
    },);

  }

  @override
  Widget build(BuildContext context) {
    FirstPageViewModel? firstPageViewModel;
    firstPageViewModel = (firstPageViewModel ?? FirstPageViewModel(this));

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
          child: Container(
            height: size.height,
            width: size.width,
            color: ColorsResources.registerScreen,
            child: Stack(
              children: [



                Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SvgPicture.asset(ImageResources.drawerIcon),
                      Image.asset(ImageResources.firstPageIcon),
                      SvgPicture.asset(ImageResources.notiFicationIcon),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 105,left: 28,right: 30),
                  child: Container(
                    height: 40,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                            flex: 4,
                            child:Container(

                          child: seachTextFild(),
                        )),
                        Expanded(

                            child:Container(
                          child: SvgPicture.asset(ImageResources.menuIcon),
                        )),
                        Expanded(
                            child:Container(
                              child: SvgPicture.asset(ImageResources.locationIcon),
                            )),
                      ],
                    ),
                  ),
                ),



                Align(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 162),
                    child: Container(
                      height: double.infinity,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            categoryName(),
                            categoryItem(),

                            // conteryCode(context),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
