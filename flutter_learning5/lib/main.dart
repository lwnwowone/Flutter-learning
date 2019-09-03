import 'package:flutter/material.dart';
import 'network_tool.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  String infoString = "No data";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text("Network demo")),
            body: Column(children: <Widget>[
              RaisedButton(
                  child: Text("Action"),
                  onPressed: () {
                    NetworkTool.getInfoFromRemote().then((String info) {
                      setState(() {
                        infoString = info;
                      });
                    });
                  }),
              Text(infoString)
            ])));
  }
}
