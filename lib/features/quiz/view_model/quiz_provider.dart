import 'dart:async';

import 'package:flutter/material.dart';

class QuizProvider extends ChangeNotifier {
  int _time = 18;

  int get time => _time;

  set time(int newTime) {
    _time = newTime;

    notifyListeners();
  }

  void onInit() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (time == 0) {
        print('clock stop');
        timer.cancel();
      } else {
        time -= 1;
      }
    });
  }
}
