import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lookprior/screens/get_data/get_user_data_model.dart';
import 'package:lookprior/screens/login_screen/login_screen.dart';
import 'package:lookprior/screens/profile_page/profile_page.dart';
import 'package:lookprior/service/rest_service.dart';

import '../../app/shared_preference.dart';
import '../../common/constant/color_const.dart';
import '../../common/constant/image_const.dart';
import '../../common/widget/common_navigator.dart';
import '../first_page/first_page.dart';
import '../first_page/first_page_widget.dart';
import '../like_page/like_page.dart';
import '../message_page/message_page.dart';
import '../post_add_page/post_add_page.dart';

class BottambarPage extends StatefulWidget {
  const BottambarPage({Key? key}) : super(key: key);

  @override
  State<BottambarPage> createState() => _BottambarPageState();
}

class _BottambarPageState extends State<BottambarPage> {
  var _bottomNavIndex = 0;
  dynamic tokan;
  GetData? getData;
  String? Username;




  List<String> iconimg = [
    (ImageResources.home),
    (ImageResources.heart),
    (ImageResources.message),
    (ImageResources.usericon)
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }
  Future<GetData?> getUserData() async {
    tokan = await SherdPref.getAccessTokan();
    print("User Dtata Tokan ==> $tokan");
    dynamic userResponce = await GetRestService.getRestMethods(endPoint: '/api/v1/data/getprofiledetail', headers: {'Authorization':'Bearer $tokan'});
    print('Rsponce == > $userResponce');

        getData = await getDataFromJson(userResponce);
        print("User My Data == > $getData");
        if(getData!.success == true){

          setState(() {
            Username = getData!.userName;
          });
          print("User Name === > $Username");
        }


  }
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();
    List<Widget> navigator = [
      FirstPage(scaffoldState:scaffoldState),
      LikePage(scaffoldState:scaffoldState),
      MessagePage(scaffoldState:scaffoldState),
     tokan != null ? ProfilePage(scaffoldState:scaffoldState) : const LoginScreen(),
    ];

    return Scaffold(
        key: scaffoldState,
        drawer: draweropen(context,username: Username),
        resizeToAvoidBottomInset: false,
      body: navigator[_bottomNavIndex],
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, CommonNavigator(child: const PostAddPage()));
          },
          backgroundColor: ColorsResources.registerScreen,
          child: const Icon(
            size: 30,
            Icons.add,
            color: Colors.white,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          //notchSmoothness: NotchSmoothness.verySmoothEdge,

          activeIndex: _bottomNavIndex,
          gapLocation: GapLocation.center,
          itemCount: 4,
          tabBuilder: (index, isActive) {
            return Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SvgPicture.asset(
                  color:
                  isActive ? ColorsResources.registerScreen : Colors.grey,
                  iconimg[index],
                ),
              ),
            );
          },
          onTap: (index) {

            setState(() {
              _bottomNavIndex = index;
            });
          },
        ));

  }
}



