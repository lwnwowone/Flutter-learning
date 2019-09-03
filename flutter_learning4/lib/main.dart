import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text("Network demo")),
      body: RaisedButton(
          child: Text("Action"),
          onPressed: () {
            print("Will run printWithDelay method");
            printWithDelay().then((value) {
              print("I'm the then method for printWithDelay method!");
            });
            print("Did run printWithDelay method");
          }),
    ));
  }

  Future<void> printWithDelay() async {
    print("printWithDelay method did begin");
    await new Future.delayed(const Duration(seconds: 3), () => "3");
    print("printWithDelay method will finish");
  }
}
