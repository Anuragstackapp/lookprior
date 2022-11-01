import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lookprior/screens/password_chang_page/password_change_page.dart';
import 'package:lookprior/screens/profile_edit_page/profile_edit_page.dart';
import 'package:lookprior/screens/splash_screens/splash_screen.dart';





//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Country Pickers Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//API Collection : https://www.getpostman.com/collections/2b3e2d731ae23c6acd7e
//       routes: {
//         '/': (context) => DemoPage(),
//       },
//     );
//   }
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: const MaterialApp(

        home: SplashScreen(),
        debugShowCheckedModeBanner: false,

        //
      ),
    );
  }
}
