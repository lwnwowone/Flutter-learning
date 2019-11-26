import 'httpClient.dart';
import 'userInfoDataMeta.dart';
import 'dart:convert';

class UserInfoService {

  final httpEndpoint = "http://localhost:8080/json?name=";
  var httpClient = HttpClient();

  UserInfoService() {}

  UserInfoService.withMocks(HttpClient mockClient) {
    httpClient = mockClient;
  }

  Future<UserinfoDataMeta> getUserInfo(String userNickName) async{
    UserinfoDataMeta userinfoDataMeta = await httpClient.getRequest(httpEndpoint + userNickName).then((String responseJSONString) {
      var parsedJson = json.decode(responseJSONString);
      return new UserinfoDataMeta(parsedJson);
    });
    return userinfoDataMeta;
  }

}