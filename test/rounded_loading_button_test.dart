import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

void main() {

  testWidgets('should show progress indicator when in loading state', (tester) async {
    final btnController = new RoundedLoadingButtonController();
    
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: Material(
          child: Center(
            child: RoundedLoadingButton(
              child: Text('Tap me!', style: TextStyle(color: Colors.white)),
              controller: btnController,
              width: 200
            ),
          ),
        )
      )
    );

    btnController.start();

    await tester.pump(const Duration(seconds: 1));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('should not show progress indicator when in idle state', (tester) async {
    final btnController = new RoundedLoadingButtonController();
    
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: Material(
          child: Center(
            child: RoundedLoadingButton(
              child: Text('Tap me!', style: TextStyle(color: Colors.white)),
              controller: btnController,
              width: 200
            ),
          ),
        )
      )
    );

    expect(find.byType(CircularProgressIndicator), findsNothing);
  });

  testWidgets('should show icon when in success state', (tester) async {
    final btnController = new RoundedLoadingButtonController();
    
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: Material(
          child: Center(
            child: RoundedLoadingButton(
              child: Text('Tap me!', style: TextStyle(color: Colors.white)),
              controller: btnController,
              width: 200
            ),
          ),
        )
      )
    );

    btnController.success();

    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.check), findsOneWidget);
  });

  testWidgets('should show icon when in error state', (tester) async {
    final btnController = new RoundedLoadingButtonController();
    
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: Material(
          child: Center(
            child: RoundedLoadingButton(
              child: Text('Tap me!', style: TextStyle(color: Colors.white)),
              controller: btnController,
              width: 200
            ),
          ),
        )
      )
    );

    btnController.error();

    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.close), findsOneWidget);
  });
}
