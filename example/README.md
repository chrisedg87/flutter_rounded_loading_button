# example_app

    class _MyHomePageState extends State<MyHomePage> {

    final RoundedLoadingButtonController _btnController = new RoundedLoadingButtonController();

    void _doSomething() async {
        Timer(Duration(seconds: 3), () {
        _btnController.success();
        });
    }

    @override
    Widget build(BuildContext context) {

        return Scaffold(
        appBar: AppBar(

            title: Text(widget.title),
        ),
        body: Center(
            child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                RoundedLoadingButton(
                child: Text('Tap me!', style: TextStyle(color: Colors.white)),
                controller: _btnController,
                onPressed: _doSomething,
                )
            ],
            ),
        )
        );
    }
    }

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
