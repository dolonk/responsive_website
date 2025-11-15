import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_website/utility/default_sizes/font_size.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';

class PopularBadge extends StatelessWidget {
  const PopularBadge({super.key});

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;

    return Container(
          padding: EdgeInsets.symmetric(horizontal: s.paddingMd, vertical: s.paddingSm),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Color(0xFFF59E0B), Color(0xFFFBBF24)]),
            borderRadius: BorderRadius.circular(s.borderRadiusLg),
            boxShadow: [
              BoxShadow(color: Color(0xFFFBBF24).withAlpha((255 * 0.5).round()), blurRadius: 15, offset: Offset(0, 4)),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.star_rounded, color: Colors.white, size: 16),
              SizedBox(width: 4),
              Text(
                'POPULAR',
                style: fonts.labelMedium.rubik(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
        )
        .animate(onPlay: (controller) => controller.repeat())
        .shimmer(duration: 2000.ms, color: Colors.white.withAlpha((255 * 0.5).round()));
  }
}
