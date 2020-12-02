import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

void main() {

  testWidgets('should show progress indicator when loading', (tester) async {
    final btnController = RoundedLoadingButtonController();
    
    await tester.pumpWidget(
      RoundedLoadingButton(
        child: Text('Tap me!', style: TextStyle(color: Colors.white)),
        controller: btnController,
        width: 200,
        color: Colors.purple,
      )
    );

    btnController.start();
    
    expect(find.byType(Text), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
