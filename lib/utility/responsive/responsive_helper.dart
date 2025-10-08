import 'package:flutter/material.dart';

class ResponsiveHelper {
  ResponsiveHelper._();

  // 📱 Breakpoints (customize করতে পারবে)
  static const double mobileBreakpoint = 650;
  static const double tabletBreakpoint = 1100;

  // ✅ Context-based device type checks (RECOMMENDED)
  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < mobileBreakpoint;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= mobileBreakpoint &&
      MediaQuery.of(context).size.width < tabletBreakpoint;

  static bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= tabletBreakpoint;

  // ✅ Get screen dimensions
  static double getWidth(BuildContext context) => MediaQuery.of(context).size.width;

  static double getHeight(BuildContext context) => MediaQuery.of(context).size.height;

  // ✅ Responsive value picker
  /// Example: ResponsiveHelper.value(context, mobile: 16, tablet: 20, desktop: 24)
  static T value<T>(BuildContext context, {required T mobile, T? tablet, required T desktop}) {
    if (isDesktop(context)) return desktop;
    if (isTablet(context)) return tablet ?? mobile;
    return mobile;
  }

  // ✅ Responsive widget builder
  static Widget builder({
    required BuildContext context,
    required Widget mobile,
    Widget? tablet,
    required Widget desktop,
  }) {
    if (isDesktop(context)) return desktop;
    if (isTablet(context)) return tablet ?? mobile;
    return mobile;
  }
}

extension ResponsiveContext on BuildContext {
  bool get isMobile => ResponsiveHelper.isMobile(this);
  bool get isTablet => ResponsiveHelper.isTablet(this);
  bool get isDesktop => ResponsiveHelper.isDesktop(this);

  double get screenWidth => ResponsiveHelper.getWidth(this);
  double get screenHeight => ResponsiveHelper.getHeight(this);

  // Responsive value shorthand
  T responsive<T>({required T mobile, T? tablet, required T desktop}) =>
      ResponsiveHelper.value(this, mobile: mobile, tablet: tablet, desktop: desktop);
}
