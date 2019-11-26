import 'package:dio/dio.dart';

class HttpClient {

  Future<String> getRequest(String urlString) async{
    Response response;
    try {
      response = await Dio().get(urlString);
      String jsonString = response.data;
      return jsonString;
    } catch (e) {
      print(e);
      return e;
    }
  }

}