import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/constant/color_const.dart';
import '../../common/constant/image_const.dart';
import '../../common/widget/common_navigator.dart';
import '../first_page/first_page.dart';
import '../like_page/like_page.dart';
import '../login_screen/login_screen.dart';
import '../message_page/message_page.dart';
import '../post_add_page/post_add_page.dart';

// class BottambarPage extends StatefulWidget {
//   const BottambarPage({Key? key}) : super(key: key);
//
//   @override
//   State<BottambarPage> createState() => _BottambarPageState();
// }
//
// class _BottambarPageState extends State<BottambarPage> {
//   var _bottomNavIndex = 0;
//   List<Widget> navigator = [
//     const FirstPage(),
//     const LikePage(),
//     const MessagePage(),
//     const LoginScreen(),
//   ];
//   List<String> iconimg = [
//     (ImageResources.home),
//     (ImageResources.heart),
//     (ImageResources.message),
//     (ImageResources.usericon)
//   ];
//   GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         key: _scaffoldState,
//       body: navigator[_bottomNavIndex],
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             Navigator.push(
//                 context, CommonNavigator(child: const PostAddPage()));
//           },
//           backgroundColor: ColorsResources.registerScreen,
//           child: const Icon(
//             size: 40,
//             Icons.add,
//             color: Colors.white,
//           ),
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//         bottomNavigationBar: AnimatedBottomNavigationBar.builder(
//           //notchSmoothness: NotchSmoothness.verySmoothEdge,
//           activeIndex: _bottomNavIndex,
//           gapLocation: GapLocation.center,
//           itemCount: 4,
//           tabBuilder: (index, isActive) {
//             return Container(
//               height: 27,
//               width: 27,
//               margin:
//               const EdgeInsets.only(top: 7, left: 9, bottom: 8, right: 12),
//               alignment: Alignment.center,
//               child: Padding(
//                 padding: const EdgeInsets.all(8),
//                 child: SvgPicture.asset(
//                   color:
//                   isActive ? ColorsResources.registerScreen : Colors.grey,
//                   iconimg[index],
//                 ),
//               ),
//             );
//           },
//           onTap: (index) {
//             setState(() {
//               _bottomNavIndex = index;
//               Navigator.push(context, MaterialPageRoute(
//                 builder: (context) {
//                   return navigator[index];
//                 },
//               ));
//             });
//           },
//         ));
//
//   }
// }
