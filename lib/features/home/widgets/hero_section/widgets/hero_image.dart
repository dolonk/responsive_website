import 'package:flutter/material.dart';
import '../../../../../utility/constants/colors.dart';
import 'package:responsive_website/utility/default_sizes/font_size.dart';
import 'package:responsive_website/utility/responsive/responsive_helper.dart';

class HeroImage extends StatefulWidget {
  const HeroImage({super.key});

  @override
  State<HeroImage> createState() => _HeroImageState();
}

class _HeroImageState extends State<HeroImage> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: const Duration(milliseconds: 1200), vsync: this);

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.05,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        DiamondGradiantShape(
          vector1Width: context.responsiveValue(mobile: 500, tablet: 500, desktop: 530),
          vector1Height: context.responsiveValue(mobile: 400, tablet: 450, desktop: 500),
          vector2Width: context.responsiveValue(mobile: 350, tablet: 420, desktop: 440),
          vector2Height: context.responsiveValue(mobile: 400, tablet: 450, desktop: 500),
        ),

        // APP DEVELOPMENT Text
        Positioned(
          top: context.responsiveValue(mobile: 60, desktop: 80),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 400),
            opacity: 1,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Text("APP DEVELOPMENT", style: context.fonts.displayLarge),
            ),
          ),
        ),

        Image.asset(
          'assets/home/hero_section/dk.png',
          height: context.responsiveValue(mobile: 400, tablet: 450, desktop: 500),
          fit: BoxFit.cover,
        ),

        // FLUTTER EXPERT Text
        Positioned(
          bottom: context.responsiveValue(mobile: 6, desktop: 20),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 400),
            opacity: 0.6,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Text(
                "FLUTTER EXPERT",
                style: context.fonts.displayLarge.copyWith(
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 1
                    ..color = DColors.textPrimary,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
