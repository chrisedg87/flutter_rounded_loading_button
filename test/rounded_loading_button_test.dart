import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class MockOnPressedFunction {
  int called = 0;

  void handler() {
    called++;
  }
}

void main() {
  late MockOnPressedFunction mockOnPressedFunction;

  setUp(() {
    mockOnPressedFunction = MockOnPressedFunction();
  });

  testWidgets('should call tap function', (WidgetTester tester) async {
    final RoundedLoadingButtonController btnController =
        RoundedLoadingButtonController();

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: Material(
          child: Center(
            child: RoundedLoadingButton(
              color: Colors.blue,
              onPressed: mockOnPressedFunction.handler,
              animateOnTap: false,
              controller: btnController,
              width: 200,
              child: const Text(
                'Tap me!',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.byType(RoundedLoadingButton));

    expect(mockOnPressedFunction.called, 1);
  });

  testWidgets('should show progress indicator when in loading state',
      (WidgetTester tester) async {
    final RoundedLoadingButtonController btnController =
        RoundedLoadingButtonController();

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: Material(
          child: Center(
            child: RoundedLoadingButton(
              color: Colors.blue,
              onPressed: mockOnPressedFunction.handler,
              controller: btnController,
              width: 200,
              child:
                  const Text('Tap me!', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ),
    );

    btnController.start();

    await tester.pump(const Duration(seconds: 1));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('should stop and return to default', (WidgetTester tester) async {
    final RoundedLoadingButtonController btnController =
        RoundedLoadingButtonController();

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: Material(
          child: Center(
            child: RoundedLoadingButton(
              controller: btnController,
              color: Colors.blue,
              onPressed: mockOnPressedFunction.handler,
              width: 200,
              child:
                  const Text('Tap me!', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ),
    );

    btnController.start();

    await tester.pump(const Duration(seconds: 1));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    btnController.stop();

    await tester.pumpAndSettle();

    expect(find.text('Tap me!'), findsOneWidget);
  });

  testWidgets('should reset to default state', (WidgetTester tester) async {
    final RoundedLoadingButtonController btnController =
        RoundedLoadingButtonController();

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: Material(
          child: Center(
            child: RoundedLoadingButton(
              color: Colors.blue,
              onPressed: mockOnPressedFunction.handler,
              controller: btnController,
              width: 200,
              child:
                  const Text('Tap me!', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ),
    );

    btnController.success();

    await tester.pumpAndSettle();

    btnController.reset();

    await tester.pumpAndSettle();

    expect(find.text('Tap me!'), findsOneWidget);
  });

  testWidgets('should not show progress indicator when in idle state',
      (WidgetTester tester) async {
    final RoundedLoadingButtonController btnController =
        RoundedLoadingButtonController();

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: Material(
          child: Center(
            child: RoundedLoadingButton(
              color: Colors.blue,
              onPressed: mockOnPressedFunction.handler,
              controller: btnController,
              width: 200,
              child: const Text(
                'Tap me!',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsNothing);
  });

  testWidgets('should show icon when in success state',
      (WidgetTester tester) async {
    final RoundedLoadingButtonController btnController =
        RoundedLoadingButtonController();

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: Material(
          child: Center(
            child: RoundedLoadingButton(
              color: Colors.blue,
              onPressed: mockOnPressedFunction.handler,
              controller: btnController,
              width: 200,
              child: const Text(
                'Tap me!',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );

    btnController.success();

    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.check), findsOneWidget);
  });

  testWidgets('should show icon when in error state',
      (WidgetTester tester) async {
    final RoundedLoadingButtonController btnController =
        RoundedLoadingButtonController();

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: Material(
          child: Center(
            child: RoundedLoadingButton(
              color: Colors.blue,
              onPressed: mockOnPressedFunction.handler,
              controller: btnController,
              width: 200,
              child:
                  const Text('Tap me!', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ),
    );

    btnController.error();

    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.close), findsOneWidget);
  });
}
