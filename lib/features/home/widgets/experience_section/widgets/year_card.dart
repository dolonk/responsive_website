import 'package:flutter/material.dart';
import 'package:responsive_website/utility/default_sizes/font_size.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';
import 'package:responsive_website/utility/responsive/responsive_helper.dart';

class YearsCard extends StatelessWidget {
  const YearsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;

    return Container(
      width: context.responsiveValue(mobile: double.infinity, tablet: 340, desktop: 340),
      height: context.responsiveValue(mobile: 210, tablet: 210, desktop: 312),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment(-0.2, -1.0),
          end: Alignment(0.2, 1.0),
          colors: [Color.fromRGBO(113, 9, 41, 0.15), Color.fromRGBO(65, 65, 65, 0.15)],
        ),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color.fromRGBO(250, 250, 250, 0.10)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Years Number
          Text("3 +", style: fonts.displayLarge),
          SizedBox(height: s.paddingMd),

          // Years Text
          Text("Years of\nExperience", style: fonts.displayMedium, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
