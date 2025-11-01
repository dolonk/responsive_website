import 'animated_counter.dart';
import 'package:flutter/material.dart';
import '../../../../../utility/constants/colors.dart';
import 'package:responsive_website/utility/default_sizes/font_size.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';
import 'package:responsive_website/utility/responsive/responsive_helper.dart';

class StartCard extends StatefulWidget {
  final String icon;
  final int number;
  final String title;
  final int index;

  const StartCard({super.key, required this.icon, required this.number, required this.title, this.index = 0});

  @override
  State<StartCard> createState() => _StartCardState();
}

class _StartCardState extends State<StartCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: const Duration(milliseconds: 600), vsync: this);

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    Future.delayed(Duration(milliseconds: 150 * widget.index), () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;

    return FadeTransition(
      opacity: _fadeAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          padding: EdgeInsets.all(context.isMobile ? 0 : s.paddingMd),
          decoration: BoxDecoration(
            color: DColors.cardBackground,
            borderRadius: BorderRadius.circular(s.borderRadiusLg),
            border: Border.all(color: DColors.cardBorder, width: 1.5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Icon
              Text(
                widget.icon,
                style: TextStyle(fontSize: context.responsiveValue(mobile: 36, tablet: 44, desktop: 52)),
              ),

              // Animated Counter
              AnimatedCounter(
                targetValue: widget.number,
                duration: const Duration(milliseconds: 2000),
                delay: Duration(milliseconds: 200 * widget.index),
                textStyle: fonts.headlineLarge.rajdhani(
                  color: DColors.primaryButton,
                  fontWeight: FontWeight.bold,
                  fontSize: context.responsiveValue(mobile: 32, tablet: 36, desktop: 40),
                ),
              ),

              // Title
              Text(
                widget.title,
                style: fonts.bodyMedium.rubik(
                  color: DColors.textSecondary,
                  fontSize: context.responsiveValue(mobile: 13, tablet: 14, desktop: 15),
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
