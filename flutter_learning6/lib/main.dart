import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  static const platform =
      const MethodChannel('samples.flutter.native_interaction');

  String message = "Demo for native interaction";

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
          title: Text("Native interaction"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                getInfoFromNativeCode().then((String info){
                  setState(() {
                    message = info;
                  });
                });
              },
            ),
          ],
      ),
      body: Text(message),
    ));
  }

  Future<String> getInfoFromNativeCode() async {
    String result;

    try {
      result = await platform.invokeMethod('getInfo');
    } on PlatformException catch (e) {
      result = e.toString();
    }

    return result;
  }
}
