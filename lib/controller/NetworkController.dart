import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
class NetworkController
{
  static const Duration timeOut=Duration(seconds: 30);
  static Map<String,String> geHeader({String method='GET'})
  {
    Map<String,String> header=<String,String>{};
    header['Authorization']="token";
    if(method!="GET")
    {
      header['Content-type']="application/json";
    }
    return header;
  }
  static Future<String?> get(String url,String body,{String header=''}) async{
print('api called');
    try {
      var client = http.Client();
      final response = await client.get(Uri.parse(url),).timeout(timeOut);
      if(response.statusCode==200)
      {
        return response.body;
      }
      print(response);
    } catch(ex) {
      if(kDebugMode)
      {
        print(ex.toString());
      }
    }
  }
}