import 'package:flutter/material.dart';
import 'package:responsive_website/utility/constants/colors.dart';
import 'package:responsive_website/utility/default_sizes/font_size.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';

class DeliverableItem extends StatelessWidget {
  final String text;

  const DeliverableItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;

    return Padding(
      padding: EdgeInsets.only(bottom: s.paddingSm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Green Checkmark
          Icon(Icons.check_circle_rounded, color: const Color(0xFF10B981), size: 20),
          SizedBox(width: s.paddingSm),

          // Text
          Expanded(
            child: Text(text, style: fonts.bodySmall.rubik(color: DColors.textSecondary, height: 1.5)),
          ),
        ],
      ),
    );
  }
}
