import 'package:flutter/material.dart';
import '../../../../../utility/constants/colors.dart';
import 'package:responsive_website/utility/default_sizes/font_size.dart';
import 'package:responsive_website/utility/responsive/responsive_helper.dart';

class HeroImage extends StatelessWidget {
  const HeroImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Diamond Background Gradient
        DiamondGradiantShape(
          vector1Width: context.responsive(mobile: 500, tablet: 500, desktop: 530),
          vector1Height: context.responsive(mobile: 400, tablet: 450, desktop: 500),
          vector2Width: context.responsive(mobile: 350, tablet: 420, desktop: 440),
          vector2Height: context.responsive(mobile: 400, tablet: 450, desktop: 500),
        ),

        // APP DEVELOPMENT Text
        Positioned(
          top: context.responsive(mobile: 60, desktop: 80),
          child: Text("APP DEVELOPMENT", style: context.fonts.displayLarge),
        ),

        // Hero Image
        Image.asset(
          'assets/home/hero_section/dk.png',
          height: context.responsive(mobile: 400, tablet: 450, desktop: 500),
          fit: BoxFit.cover,
        ),

        // FLUTTER EXPERT Text (Stroke)
        Positioned(
          bottom: context.responsive(mobile: 6, desktop: 20),
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
      ],
    );
  }
}
