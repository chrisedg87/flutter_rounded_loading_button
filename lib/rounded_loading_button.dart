library rounded_loading_button;

import 'package:flutter/material.dart';

class RoundedLoadingButton extends StatefulWidget {
  final RoundedLoadingButtonController controller;

  final VoidCallback onPressed;

  final Widget child;

  final Color color;

  final double height;

  RoundedLoadingButton(
      {Key key,
      this.controller,
      this.onPressed,
      this.child,
      this.color = Colors.blue,
      this.height = 50});

  @override
  State<StatefulWidget> createState() => RoundedLoadingButtonState();
}

class RoundedLoadingButtonState extends State<RoundedLoadingButton>
    with TickerProviderStateMixin {
  AnimationController _buttonController;
  AnimationController _checkButtonControler;

  Animation _squeezeAnimation;
  Animation _bounceAnimation;

  bool _isSuccessful = false;
  bool _isErrored = false;

  @override
  Widget build(BuildContext context) {
    var _check = Container(
        alignment: FractionalOffset.center,
        decoration: new BoxDecoration(
          color: widget.color,
          borderRadius:
              new BorderRadius.all(Radius.circular(_bounceAnimation.value / 2)),
        ),
        width: _bounceAnimation.value,
        height: _bounceAnimation.value,
        child: _bounceAnimation.value > 20
            ? Icon(
                Icons.check,
                color: Colors.white,
              )
            : null);

    var _cross = Container(
        alignment: FractionalOffset.center,
        decoration: new BoxDecoration(
          color: Colors.red,
          borderRadius:
              new BorderRadius.all(Radius.circular(_bounceAnimation.value / 2)),
        ),
        width: _bounceAnimation.value,
        height: _bounceAnimation.value,
        child: _bounceAnimation.value > 20
            ? Icon(
                Icons.close,
                color: Colors.white,
              )
            : null);

    var _loader = SizedBox(
        height: widget.height - 25,
        width: widget.height - 25,
        child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            strokeWidth: 2));

    var _btn = ButtonTheme(
      shape:
          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(35)),
      minWidth: _squeezeAnimation.value,
      height: widget.height,
      child: RaisedButton(
          child: _squeezeAnimation.value > 150 ? widget.child : _loader,
          color: widget.color,
          onPressed: () async {
            _start();
          }),
    );

    return Container(
        height: widget.height,
        child:
            Center(child: _isErrored ? _cross : _isSuccessful ? _check : _btn));
  }

  @override
  void initState() {
    super.initState();

    _buttonController = new AnimationController(
        duration: new Duration(milliseconds: 500), vsync: this);

    _checkButtonControler = new AnimationController(
        duration: new Duration(milliseconds: 1000), vsync: this);

    _bounceAnimation = Tween<double>(begin: 0, end: widget.height).animate(
        new CurvedAnimation(
            parent: _checkButtonControler, curve: Curves.elasticOut));
    _bounceAnimation.addListener(() {
      setState(() {});
    });

    _squeezeAnimation = Tween<double>(begin: 300, end: widget.height).animate(
        new CurvedAnimation(
            parent: _buttonController, curve: Curves.easeInOutCirc));
    _squeezeAnimation.addListener(() {
      setState(() {});
    });

    _squeezeAnimation.addStatusListener((state) {
      if (state == AnimationStatus.completed) {
        widget.onPressed();
      }
    });

    widget.controller?._addListeners(_start, _stop, _success, _error, _reset);
  }

  @override
  void dispose() {
    _buttonController.dispose();
    _checkButtonControler.dispose();
    super.dispose();
  }

  _start() {
    _buttonController.forward();
  }

  _stop() {
    _isSuccessful = false;
    _isErrored = false;
    _buttonController.reverse();
  }

  _success() {
    _isSuccessful = true;
    _isErrored = false;
    _checkButtonControler.forward();
  }

  _error() {
    _isErrored = true;
    _checkButtonControler.forward();
  }

  _reset() {
    _isSuccessful = false;
    _isErrored = false;
    _buttonController.reverse();
  }
}

class RoundedLoadingButtonController {
  VoidCallback _startListener;
  VoidCallback _stopListener;
  VoidCallback _successListener;
  VoidCallback _errorListener;
  VoidCallback _resetListener;

  _addListeners(
      VoidCallback startListener,
      VoidCallback stopListener,
      VoidCallback successListener,
      VoidCallback errorListener,
      VoidCallback resetListener) {
    this._startListener = startListener;
    this._stopListener = stopListener;
    this._successListener = successListener;
    this._errorListener = errorListener;
    this._resetListener = resetListener;
  }

  start() {
    _startListener();
  }

  stop() {
    _stopListener();
  }

  success() {
    _successListener();
  }

  error() {
    _errorListener();
  }

  reset() {
    _resetListener();
  }
}
