// ignore_for_file: constant_identifier_names



import 'package:flutter/material.dart';
import 'package:flutter_firebase_quiz_app/core/keys/global_key.dart';
import 'package:flutter_firebase_quiz_app/core/shared_widgets/custom_messenger.dart';

enum CustomMessengerState {
  SUCCESS,
  INFO,
  WARNING,
  ERROR,
}

extension CustomMessengerHelper on CustomMessengerState {
  Color getColor() {
    switch (this) {
      case CustomMessengerState.SUCCESS:
        return Colors.green;
      case CustomMessengerState.INFO:
        return Colors.blue;
      case CustomMessengerState.WARNING:
        return Colors.orange;
      case CustomMessengerState.ERROR:
        return Colors.red;
    }
  }

  IconData getIcon() {
    switch (this) {
      case CustomMessengerState.SUCCESS:
        return Icons.check_outlined;
      case CustomMessengerState.INFO:
        return Icons.priority_high;
      case CustomMessengerState.WARNING:
        return Icons.priority_high;
      case CustomMessengerState.ERROR:
        return Icons.priority_high;
    }
  }
}

void showCustomMessenger(CustomMessengerState messengerState, String content) {
  ScaffoldMessenger.of(GlobalContextKey.instance.globalKey.currentContext!).showSnackBar(
    SnackBar(
      margin: const EdgeInsets.only(bottom: 32),
      backgroundColor: Colors.transparent,
      content: CustomMessenger(state: messengerState, content: content),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
      elevation: 0,
    ),
  );
}
