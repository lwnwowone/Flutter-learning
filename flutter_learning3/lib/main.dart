import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  List<Map<String, String>> userDataList = [];

  @override
  void initState() {
    // TODO: implement initState
    initData();
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
//    if(userDataList.isEmpty) initData();

    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("First Flutter APP"),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    print("add new item");
                    setState(() {
                      addNewItemToUserDataList();
                    });
                  },
                ),
              ],
            ),
            body: ListView.builder(
                itemCount: userDataList.length,
                itemBuilder: (BuildContext context, int index) {
                  return getRow(userDataList.elementAt(index));
                })
        )
    );
  }

  Widget getRow(Map<String, String> userInfo) {
//    return Text(userInfo["nick_name"]);

    return Container(
      margin: const EdgeInsets.all(10.0),
      height: 160.0,
      color: Colors.grey,
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

  void initData() {
    Map<String, String> userInfo = Map();
    userInfo["avatar"] = "image_0.jpeg";
    userInfo["nick_name"] = "Harry";
    userInfo["age"] = "20";
    userDataList.add(userInfo);

    userInfo = Map();
    userInfo["avatar"] = "image_1.jpeg";
    userInfo["nick_name"] = "Ron";
    userInfo["age"] = "20";
    userDataList.add(userInfo);

    userInfo = Map();
    userInfo["avatar"] = "image_2.jpeg";
    userInfo["nick_name"] = "Hermione";
    userInfo["age"] = "20";
    userDataList.add(userInfo);
  }

  void addNewItemToUserDataList() {
    Map<String, String> userInfo = Map();
    userInfo["avatar"] = "image_default.jpeg";
    userInfo["nick_name"] = "Unknown";
    userInfo["age"] = "??";
    userDataList.add(userInfo);
  }
}
