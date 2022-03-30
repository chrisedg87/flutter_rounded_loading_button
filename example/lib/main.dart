import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rounded Loading Button Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final RoundedLoadingButtonController _btnController1 =
      RoundedLoadingButtonController();

  final RoundedLoadingButtonController _btnController2 =
      RoundedLoadingButtonController();

  Future<void> _doSomething(RoundedLoadingButtonController controller) async {
    Timer(const Duration(seconds: 10), () {
      controller.success();
    });
  }

  @override
  void initState() {
    super.initState();
    _btnController1.stateStream.listen((ButtonState value) {
      if (kDebugMode) {
        print(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rounded Loading Button Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundedLoadingButton(
              successIcon: Icons.cloud,
              failedIcon: Icons.cottage,
              controller: _btnController1,
              onPressed: () => _doSomething(_btnController1),
              child:
                  const Text('Tap me!', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(
              height: 50,
            ),
            RoundedLoadingButton(
              color: Colors.amber,
              successColor: Colors.amber,
              controller: _btnController2,
              onPressed: () => _doSomething(_btnController2),
              valueColor: Colors.black,
              borderRadius: 10,
              child: const Text(
                '''
Tap me i have a huge text''',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            OutlinedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                onPressed: () {
                  _btnController1.reset();
                  _btnController2.reset();
                },
                child: const Text('Reset')),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              onPressed: () {
                _btnController1.error();
                _btnController2.error();
              },
              child: const Text('Error'),
            ),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              onPressed: () {
                // _btnController1.success();
                // _btnController2.success();
                // _btnController1
                if (kDebugMode) {
                  print(_btnController1.currentState);
                }
              },
              child: const Text('Success'),
            )
          ],
        ),
      ),
    );
  }
}
