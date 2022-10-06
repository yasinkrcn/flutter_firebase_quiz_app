

import 'package:flutter/material.dart';

class ScreenSize {
  static final ScreenSize _instance = ScreenSize._init();
  ScreenSize._init();

  factory ScreenSize() {
    return _instance;
  }

  factory ScreenSize.init(BuildContext context) {
    _instance.screenSize = MediaQuery.of(context).size;
    _instance.bottomMargin = MediaQuery.of(context).padding.bottom;
    _instance.topMargin = MediaQuery.of(context).padding.top;
    _instance.centerOfHeight = _instance.screenSize.height / 2;
    _instance.centerOfWidht = _instance.screenSize.width / 2;

    return _instance;
  }

  late Size screenSize;
  late double topMargin;
  late double bottomMargin;
  late double centerOfHeight;
  late double centerOfWidht;

  double getHeightPercent(double percent) {
    return screenSize.height * percent;
  }

  double getWidthPercent(double percent) {
    return screenSize.width * percent;
  }

  double getBodyHeight() {
    return screenSize.height - (topMargin + bottomMargin);
  }

  set setScreenSize(Size size) => screenSize = size;
}
