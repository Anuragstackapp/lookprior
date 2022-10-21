import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lookprior/screens/profile_page/profile_page.dart';

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



  List<String> iconimg = [
    (ImageResources.home),
    (ImageResources.heart),
    (ImageResources.message),
    (ImageResources.usericon)
  ];

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();
    List<Widget> navigator = [
      FirstPage(scaffoldState:scaffoldState),
      LikePage(scaffoldState:scaffoldState),
      MessagePage(scaffoldState:scaffoldState),
      ProfilePage(scaffoldState:scaffoldState),
    ];

    return Scaffold(
        key: scaffoldState,
        drawer: draweropen(context),
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



//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   int _pageIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async => false,
//       child: Scaffold(
//         body: SafeArea(
//           child: IndexedStack(
//             index: _pageIndex,
//
//           ),
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           items: const <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.business),
//               label: 'Business',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.computer),
//               label: 'Technology',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.book),
//               label: 'Education',
//             ),
//           ],
//           currentIndex: _pageIndex,
//           onTap: (int index) {
//             setState(
//                   () {
//                 _pageIndex = index;
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
