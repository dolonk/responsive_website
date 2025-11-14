import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_website/utility/default_sizes/font_size.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';
import 'package:responsive_website/utility/responsive/responsive_helper.dart';

class PlatformBadge extends StatefulWidget {
  final IconData icon;
  final String label;
  final int delay;

  const PlatformBadge({super.key, required this.icon, required this.label, this.delay = 0});

  @override
  State<PlatformBadge> createState() => _PlatformBadgeState();
}

class _PlatformBadgeState extends State<PlatformBadge> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;

    return MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            transform: Matrix4.identity()..scale(_isHovered ? 1.1 : 1.0),
            padding: EdgeInsets.symmetric(
              horizontal: context.responsiveValue(
                mobile: s.paddingMd,
                tablet: s.paddingLg,
                desktop: s.paddingLg,
              ),
              vertical: s.paddingMd,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(_isHovered ? 0.25 : 0.15),
              borderRadius: BorderRadius.circular(s.borderRadiusLg),
              border: Border.all(color: Colors.white.withOpacity(_isHovered ? 0.6 : 0.3), width: 2),
              boxShadow: _isHovered
                  ? [BoxShadow(color: Colors.white.withOpacity(0.3), blurRadius: 20, offset: Offset(0, 5))]
                  : null,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  widget.icon,
                  color: Colors.white,
                  size: context.responsiveValue(mobile: 20, tablet: 24, desktop: 28),
                ),
                SizedBox(width: s.paddingSm),
                Text(
                  widget.label,
                  style: fonts.bodyMedium.rubik(
                    fontSize: context.responsiveValue(mobile: 14, tablet: 16, desktop: 16),
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        )
        .animate(delay: Duration(milliseconds: widget.delay))
        .fadeIn(duration: 600.ms)
        .slideY(begin: 0.3, duration: 600.ms);
  }
}
