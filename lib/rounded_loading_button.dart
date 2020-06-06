library rounded_loading_button;

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

enum LoadingState { idle, loading, success, error }

class RoundedLoadingButton extends StatefulWidget {
  final RoundedLoadingButtonController controller;

  final VoidCallback onPressed;

  final Widget child;

  final Color color;

  final double height;

  final double width;

  final bool animateOnTap;

  final Color valueColor;

  final Curve curve;

  RoundedLoadingButton(
      {Key key,
      this.controller,
      this.onPressed,
      this.child,
      this.color,
      this.height = 50,
      this.width = 300,
      this.animateOnTap = true,
      this.valueColor = Colors.white,
      this.curve = Curves.easeInOutCirc});

  @override
  State<StatefulWidget> createState() => RoundedLoadingButtonState();
}

class RoundedLoadingButtonState extends State<RoundedLoadingButton>
    with TickerProviderStateMixin {
  AnimationController _buttonController;
  AnimationController _checkButtonControler;

  Animation _squeezeAnimation;
  Animation _bounceAnimation;

  final _state = BehaviorSubject<LoadingState>.seeded(LoadingState.idle);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    var _check = Container(
        alignment: FractionalOffset.center,
        decoration: new BoxDecoration(
          color: widget.color ?? theme.primaryColor,
          borderRadius:
              new BorderRadius.all(Radius.circular(_bounceAnimation.value / 2)),
        ),
        width: _bounceAnimation.value,
        height: _bounceAnimation.value,
        child: _bounceAnimation.value > 20
            ? Icon(
                Icons.check,
                color: widget.valueColor,
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
                color: widget.valueColor,
              )
            : null);

    var _loader = SizedBox(
        height: widget.height - 25,
        width: widget.height - 25,
        child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(widget.valueColor),
            strokeWidth: 2));

    var childStream = StreamBuilder(
      stream: _state,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return AnimatedSwitcher(
            duration: Duration(milliseconds: 200),
            child:
                snapshot.data == LoadingState.loading ? _loader : widget.child);
      },
    );

    var _btn = ButtonTheme(
        shape:
            RoundedRectangleBorder(borderRadius: new BorderRadius.circular(35)),
        minWidth: _squeezeAnimation.value,
        height: widget.height,
        child: RaisedButton(
            padding: EdgeInsets.all(0),
            child: childStream,
            color: widget.color,
            onPressed: widget.onPressed == null ? null : _btnPressed));

    return Container(
        height: widget.height,
        child: Center(
            child: _state.value == LoadingState.error
                ? _cross
                : _state.value == LoadingState.success ? _check : _btn));
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

    _squeezeAnimation = Tween<double>(begin: widget.width, end: widget.height)
        .animate(new CurvedAnimation(
            parent: _buttonController, curve: widget.curve));
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
    _state.close();
    super.dispose();
  }

  _btnPressed() async {
    if (widget.animateOnTap) {
      _start();
    } else {
      widget.onPressed();
    }
  }

  _start() {
    _state.sink.add(LoadingState.loading);
    _buttonController.forward();
  }

  _stop() {
    _state.sink.add(LoadingState.idle);
    _buttonController.reverse();
  }

  _success() {
    _state.sink.add(LoadingState.success);
    _checkButtonControler.forward();
  }

  _error() {
    _state.sink.add(LoadingState.error);
    _checkButtonControler.forward();
  }

  _reset() {
    _state.sink.add(LoadingState.idle);
    _buttonController.reverse();
    _checkButtonControler.reset();
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
