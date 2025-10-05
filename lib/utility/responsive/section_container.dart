import 'package:flutter/material.dart';
import 'package:responsive_website/utility/responsive/responsive_helper.dart';

class SectionContainer extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final EdgeInsets? padding;

  const SectionContainer({super.key, required this.child, this.backgroundColor, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: backgroundColor ?? Colors.white,
      padding:
          padding ??
          EdgeInsets.symmetric(horizontal: ResponsiveHelper.isMobile(context) ? 20 : 80, vertical: 60),
      child: child,
    );
  }
}
