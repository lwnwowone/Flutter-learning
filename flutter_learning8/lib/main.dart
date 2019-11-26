import 'package:flutter/material.dart';
import 'dart:io';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    HttpServer
        .bind("localhost", 9527)
        .then((HttpServer server) {
        server.listen((HttpRequest request) {
          print("request received: method = " + request.method + ", uri = " + request.uri.toString());
          if("GET" == request.method && request.uri.toString() == "/hello_flutter") {
            request.response.write("Hello Flutter!");
          }
          else {
            request.response.write("Unhandled API endpoint!");
            request.response.close();
          }
        request.response.close();
      });
    });

    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text("File Read&Wirte")),
            body: Text("Try GET request to \"localhost:9527/hello_flutter\"")
        )
    );
  }



}