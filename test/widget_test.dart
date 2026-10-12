import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:form_widget_demo/main.dart';

void main() {
  testWidgets('Empty form shows validation errors', (tester) async {
    await tester.pumpWidget(const FormApp());

    await tester.tap(find.text('Submit'));
    await tester.pump();

    expect(find.text('Please enter your name'), findsOneWidget);
    expect(find.text('Please enter a valid email'), findsOneWidget);
  });

  testWidgets('Valid form shows greeting', (tester) async {
    await tester.pumpWidget(const FormApp());

    final fields = find.byType(TextFormField);
    await tester.enterText(fields.at(0), 'Jane');
    await tester.enterText(fields.at(1), 'jane@example.com');
    await tester.tap(find.text('Submit'));
    await tester.pump();

    expect(find.text('Hello Jane!'), findsOneWidget);
  });
}
