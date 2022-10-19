import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class SherdPref{
  static Future<void> setAccessTokan(String Key,String value) async {
     final prefs = await SharedPreferences.getInstance();
     await prefs.setString("$Key", "$value");

     print("Anurag Value ==> $value");
  }

}

