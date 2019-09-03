import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';//path_provider: ^0.5.0

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  String infoString = "info label";
  TextEditingController _controller = TextEditingController();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("File Read&Wirte")),
        body: Column(children: <Widget>[
          Row(children: <Widget>[
            RaisedButton(
              child: Text("Save"),
              onPressed: (){
                _writeString(_controller.text);
              },
            ),
            SizedBox(width: 20),
            RaisedButton(
              child: Text("Load"),
              onPressed: (){
                _readContent().then((fileContent){
                  setState(() {
                    infoString = fileContent;
                  });
                });
              },
            ),
          ]),
          SizedBox(height: 10),
          TextField(
            controller: _controller,
          ),
          SizedBox(height: 10),
          Text(infoString)
        ],)
      )
    );
  }

  Future<File> _getLocalFile() async {
    // get the path to the document directory.
    String dir = (await getApplicationDocumentsDirectory()).path;
    return new File('$dir/tmp.txt');
  }

  Future<Null> _writeString(String fileContent) async {
    await (await _getLocalFile()).writeAsString('$fileContent');
  }

  Future<String> _readContent() async {
    try {
      File file = await _getLocalFile();
      // read the variable as a string from the file.
      String contents = await file.readAsString();
      return contents;
    } on FileSystemException {
      return "";
    }
  }
}