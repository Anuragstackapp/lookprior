import 'package:shared_preferences/shared_preferences.dart';

class SherdPref{
  // ignore: non_constant_identifier_names
  static Future<void> setAccessTokan(String Key,String value) async {
     final prefs = await SharedPreferences.getInstance();
     await prefs.setString(Key, value);

     print("Anurag Value ==> $value");
  }

  static Future<String?>? getAccessTokan() async {
    final prefs = await SharedPreferences.getInstance();
    final String? action = prefs.getString('access_token');

    print("Get Acsses Tokan ---> $action");

    return action;
  }

  static Future<bool> removeAccessTokan() async {
    final prefs = await SharedPreferences.getInstance();
    final success = await prefs.remove('access_token');

    return success;
  }

}

