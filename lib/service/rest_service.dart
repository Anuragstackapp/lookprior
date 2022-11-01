import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class RestService{
 static const String baseUrl = 'https://lookprstage.com/admin/';
 static const String signUpeApi = '/api/v1/data/signup';

 static dynamic postRestMethods({@ required String? endPoint, @ required Map<String, dynamic>? bodyParam,Map<String, String>? headers}) async {

  try {
    String url = "${baseUrl}${endPoint}";
    print(url);

    Response response = await http.post(Uri.parse(url),body: bodyParam,headers: headers);
    print('statusCode --> ${response.statusCode}');

    
    if(response.statusCode == 200  || response.statusCode == 201){
     print("resposence body --- ${response.body}");
     return response.body;
    }

  }  catch (e) {
    print('catch Exption for Post Api $endPoint --> $e');
  }

 }
}

class GetRestService{
  static const String baseUrl = 'https://lookprstage.com/admin/';
  static dynamic getRestMethods({@ required String? endPoint, @ required var headers}) async {

    try {
      String url = "${baseUrl}${endPoint}";
      print(url);

      Response response = await http.get(Uri.parse(url),headers: headers);
      print('statusCode --> ${response.statusCode}');

      if(response.statusCode == 200  || response.statusCode == 201){
        print("resposence body --- ${response.body}");
        return response.body;
      }

    }  catch (e) {
      print('catch Exption for Post Api $endPoint --> $e');
    }

  }
}