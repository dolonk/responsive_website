import 'package:flutter/material.dart';
import '../../../../../utility/constants/colors.dart';
import 'package:responsive_website/utility/default_sizes/font_size.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';
import 'package:responsive_website/utility/responsive/responsive_helper.dart';

/*class StatCard extends StatefulWidget {
  final String title;
  final String subtitle;

  const StatCard({super.key, required this.title, required this.subtitle});

  @override
  State<StatCard> createState() => _StatCardState();
}

class _StatCardState extends State<StatCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 300),
        child: Container(
          width: context.isMobile ? double.infinity : 300,
          height: 150,
          padding: EdgeInsets.all(s.paddingSm),
          decoration: BoxDecoration(
            color: DColors.cardBackground,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: _isHovered ? DColors.primaryButton : DColors.cardBackground, width: 2),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: DColors.primaryButton.withAlpha((255 * 0.3).round()),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ]
                : null,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.title,
                  style: fonts.headlineLarge.rajdhani(
                    color: _isHovered ? DColors.primaryButton : DColors.textPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(widget.subtitle, style: fonts.bodyMedium.rubik(color: DColors.textSecondary), textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
      ),
    );
  }
}*/

import 'animated_counter.dart';

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

    // Staggered animation based on index
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
          padding: EdgeInsets.all(
            context.responsiveValue(mobile: s.paddingMd, tablet: s.paddingLg, desktop: s.paddingXl),
          ),
          decoration: BoxDecoration(
            color: DColors.cardBackground,
            borderRadius: BorderRadius.circular(s.borderRadiusLg),
            border: Border.all(color: DColors.cardBorder, width: 1.5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ICON
              Text(
                widget.icon,
                style: TextStyle(fontSize: context.responsiveValue(mobile: 40, tablet: 48, desktop: 56)),
              ),
              SizedBox(height: s.spaceBtwItems),

              // ANIMATED COUNTER
              AnimatedCounter(
                targetValue: widget.number,
                duration: const Duration(milliseconds: 2000),
                delay: Duration(milliseconds: 200 * widget.index),
                textStyle: fonts.displayMedium.rajdhani(color: DColors.primaryButton, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: s.paddingSm),

              // TITLE
              Text(
                widget.title,
                style: fonts.bodyMedium.rubik(color: DColors.textSecondary),
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
