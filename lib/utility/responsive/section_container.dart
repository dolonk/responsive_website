import 'package:flutter/material.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';

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
      padding: padding ?? EdgeInsets.symmetric(horizontal: DSizes.paddingMd, vertical: DSizes.paddingLg),
      child: child,
    );
  }
}
