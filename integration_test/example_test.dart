import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:newaltproj/main.dart';

void main() {
  patrolTest('counter increments correctly when button is pressed', ($) async {
    // Launch the actual app
    await $.pumpWidgetAndSettle(const MyApp());

    // Verify initial counter value is 0
    expect($('0'), findsOneWidget);

    // Press the floating action button 5 times
    for (int i = 0; i < 5; i++) {
      await $.tap($(#increment_fab));
      await $.pumpAndSettle();
    }

    // Verify counter value is now 5
    expect($('5'), findsOneWidget);

    if (!Platform.isMacOS) {
      await $.native.pressHome();
    }
  });
}
