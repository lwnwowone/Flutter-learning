import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Map<String, String> userInfo;

  void initData() {
    userInfo = Map();
    userInfo["avatar"] = "image_1.jpeg";
    userInfo["nick_name"] = "Harry";
    userInfo["age"] = "20";
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    initData();
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("First Flutter APP"),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.list),
                  onPressed: () {

                  },
                ),
              ],
            ),
            body: getRow()));
  }

  Widget getRow() {
    return Container(
      margin: const EdgeInsets.all(10.0),
      height: 160.0,
      child: Row(children: <Widget>[
          Image.asset("images/" + userInfo["avatar"], height: 150, width: 150),
          SizedBox(width: 20),
          Column(
            children: <Widget>[
              Text(userInfo["nick_name"]),
              SizedBox(height: 10),
              Text(userInfo["age"]),
            ],
          ),
        ]),
      );
  }
}
