import 'package:flutter/material.dart';
import 'userInfoService.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  UserInfoService userInfoService = UserInfoService();

  String infoString = "info label";
  TextEditingController _controller = TextEditingController();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text("Sample HTTP Client")),
            body: Column(children: <Widget>[
              RaisedButton(
                key: Key("btn_get_request"),
                child: Text("GetRequest"),
                onPressed: (){
                    userInfoService.getUserInfo("Bob").then((userInfo) {
                      setState(() {
                        String tmpStr = "EnglishName = " + userInfo.englishName + "\n";
                        tmpStr += "ChineseName = " + userInfo.chineseName + "\n";
                        tmpStr += "Age = " + userInfo.age.toString() + "\n";
                        infoString = tmpStr;
                      });
                  });
                },
              ),
              SizedBox(height: 10),
              TextField(
                key: Key("lb_info"),
                controller: _controller,
              ),
              SizedBox(height: 10),
              Text(infoString)
            ],)
        )
    );
  }

}