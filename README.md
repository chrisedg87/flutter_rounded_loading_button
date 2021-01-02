# rounded_loading_button

[![pub package](https://img.shields.io/pub/v/rounded_loading_button.svg)](https://pub.dev/packages/rounded_loading_button) 
![build](https://github.com/chrisedg87/flutter_rounded_loading_button/workflows/build/badge.svg)
[![codecov](https://codecov.io/gh/chrisedg87/flutter_rounded_loading_button/branch/master/graph/badge.svg?token=3HQDMRP8N2)](https://codecov.io/gh/chrisedg87/flutter_rounded_loading_button)

RoundedLoadingButton is a Flutter package with a simple implementation of an animated loading button, complete with success and error animations.

![](screenshots/loading-button.gif)

## Installation

   Add this to your pubspec.yaml:
    
    dependencies:
        rounded_loading_button: ^1.0.0

## Usage

### Import

    import 'package:rounded_loading_button/rounded_loading_button.dart';

### Simple Implementation

    final RoundedLoadingButtonController _btnController = new RoundedLoadingButtonController();

    void _doSomething() async {
        Timer(Duration(seconds: 3), () {
            _btnController.success();
        });
    }

    RoundedLoadingButton(
        child: Text('Tap me!', style: TextStyle(color: Colors.white)),
        controller: _btnController,
        onPressed: _doSomething,
    )
    
## Contributions

   All contributions are welcome!
   
## Did you find this useful?

<a href="https://www.buymeacoffee.com/Chrisedgington" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee"  width="216" height="60" ></a>
