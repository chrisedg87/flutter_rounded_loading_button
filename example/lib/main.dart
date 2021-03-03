import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rounded Loading Button Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();

  void _doSomething() async {
    Timer(Duration(seconds: 3), () {
      _btnController.success();
    });
    Timer(Duration(seconds: 3), () {
      _btnController.reset();
    });
    Timer(Duration(seconds: 3), () {
      _btnController.error();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Rounded Loading Button Demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RoundedLoadingButton(
                child: Text('Tap me a aasa sa sa sas a sa sa sa sa s!',
                    style: TextStyle(color: Colors.white)),
                controller: _btnController,
                onPressed: _doSomething,
                width: 200,
              ),
              TextButton(child: Text("Reset"), onPressed: _btnController.reset)
            ],
          ),
        ));
  }
}
