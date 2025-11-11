import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_website/utility/constants/colors.dart';
import 'package:responsive_website/utility/default_sizes/font_size.dart';

class AnimatedCounter extends StatelessWidget {
  final String value;
  final TextStyle? style;
  final String? suffixText;

  const AnimatedCounter({super.key, required this.value, this.style, this.suffixText});

  @override
  Widget build(BuildContext context) {
    final double targetValue = double.tryParse(value) ?? 0.0;

    int decimalPlaces = 0;
    if (value.contains('.')) {
      decimalPlaces = value.split('.')[1].length;
    }

    return Animate(
      effects: [
        CustomEffect(
          duration: 2000.ms,
          curve: Curves.easeOut,
          begin: 0,
          end: targetValue,
          builder: (context, value, child) {
            String animatedNumberText = value.toStringAsFixed(decimalPlaces);
            return Text(
              '$animatedNumberText${suffixText ?? ''}',
              style:
                  style ??
                  context.fonts.headlineMedium.rajdhani(
                    fontWeight: FontWeight.bold,
                    color: DColors.textPrimary,
                  ),
            );
          },
        ),

        FadeEffect(duration: 800.ms, curve: Curves.easeIn),
      ],
    );
  }
}
