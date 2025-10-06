import 'package:flutter/material.dart';

import '../../main.dart';

class DeviceType {
  // Get global context
  static BuildContext? get globalContext => navigatorKey.currentContext;

  // Check if context is available
  static bool get hasContext => navigatorKey.currentContext != null;

  // Get screen width and height
  static double get originalWidth => MediaQuery.of(globalContext!).size.width;
  static double get originalHeight => MediaQuery.of(globalContext!).size.height;

  // Device type checks
  static bool get isMobile => originalWidth < 650;
  static bool get isTablet => originalWidth >= 650 && originalWidth < 1100;
  static bool get isDesktop => originalWidth >= 1100;
}
