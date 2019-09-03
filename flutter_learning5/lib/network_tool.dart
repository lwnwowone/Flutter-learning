import 'package:dio/dio.dart';

class NetworkTool {

  static Future<String> getInfoFromRemote() async{
    Response response;
    try {
      String requestURL = "http://www.baidu.com";
      response = await Dio().get(requestURL);
      return response.data;
    } catch (e) {
      print(e);
      return e;
    }
  }

}