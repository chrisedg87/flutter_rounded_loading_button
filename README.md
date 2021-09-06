# rounded_loading_button

[![pub package](https://img.shields.io/pub/v/rounded_loading_button.svg)](https://pub.dev/packages/rounded_loading_button) 
![build](https://github.com/chrisedg87/flutter_rounded_loading_button/workflows/build/badge.svg)
[![codecov](https://codecov.io/gh/chrisedg87/flutter_rounded_loading_button/branch/master/graph/badge.svg?token=3HQDMRP8N2)](https://codecov.io/gh/chrisedg87/flutter_rounded_loading_button)
[![style: effective dart](https://img.shields.io/badge/style-effective_dart-40c4ff.svg)](https://pub.dev/packages/effective_dart)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

RoundedLoadingButton is a Flutter package with a simple implementation of an animated loading button, complete with success and error animations.

![](screenshots/loading-button.gif)

## Installation

   Add this to your pubspec.yaml:
    
    dependencies:
        rounded_loading_button: ^2.0.3

## Usage

### Import

    import 'package:rounded_loading_button/rounded_loading_button.dart';

### Simple Implementation

    final RoundedLoadingButtonController _btnController = RoundedLoadingButtonController();

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

The Rounded Loading Button has many configurable properties, including:

* `duration` - The duration of the button animation
* `loaderSize` - The size of the CircularProgressIndicator
* `animateOnTap` -  Whether to trigger the loading animation on the tap event
* `resetAfterDuration` - Reset the animation after specified duration, defaults to 15 seconds
* `errorColor` - The color of the button when it is in the error state
* `successColor` - The color of the button when it is in the success state


## Contributions

   All contributions are welcome!

