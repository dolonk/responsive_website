import 'package:flutter/material.dart';
import '../../utility/constants/colors.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';
import 'package:responsive_website/utility/default_sizes/font_size.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.subtitle, required this.title, required this.description});

  final String subtitle;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;
    return Column(
      children: [
        // Subtitle
        Text(
          subtitle,
          style: fonts.bodyLarge.rubik(color: DColors.primaryButton, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: s.paddingSm),

        // Main Title
        Text(
          title,
          style: fonts.displayMedium.rajdhani(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: s.paddingSm),

        // Description
        Text(
          description,
          style: fonts.bodyMedium.rubik(color: DColors.textSecondary, height: 1.6),
          textAlign: TextAlign.center,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
