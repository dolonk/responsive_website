import 'package:flutter/material.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';

import '../../utility/constants/colors.dart';

class HoverableSocialIcon extends StatefulWidget {
  const HoverableSocialIcon({super.key, required this.icon, this.onTap});

  final IconData icon;
  final VoidCallback? onTap;

  @override
  State<HoverableSocialIcon> createState() => _HoverableSocialIconState();
}

class _HoverableSocialIconState extends State<HoverableSocialIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;

    const duration = Duration(milliseconds: 200);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedScale(
          duration: duration,
          scale: _isHovered ? 1.2 : 1.0,
          child: Icon(
            widget.icon,
            color: _isHovered ? DColors.primaryButton : DColors.textPrimary,
            size: s.iconMd,
          ),
        ),
      ),
    );
  }
}
