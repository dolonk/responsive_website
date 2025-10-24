import 'package:flutter/material.dart';
import '../../utility/constants/colors.dart';

class HoverableCard extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Color borderColor;
  final Color hoverBorderColor;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final double borderWidth;
  final void Function(bool isHovered)? onHoverChanged;

  const HoverableCard({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.borderColor = DColors.cardBorder,
    this.hoverBorderColor = DColors.primaryButton,
    this.borderRadius,
    this.padding,
    this.backgroundColor,
    this.borderWidth = 2,
    this.onHoverChanged,
  });

  @override
  State<HoverableCard> createState() => _HoverableCardState();
}

class _HoverableCardState extends State<HoverableCard> {
  bool _isHovered = false;

  void _updateHoverState(bool isHovered) {
    if (_isHovered != isHovered) {
      setState(() => _isHovered = isHovered);
      widget.onHoverChanged?.call(isHovered);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _updateHoverState(true),
      onExit: (_) => _updateHoverState(false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: widget.duration,
        curve: Curves.easeInOut,
        padding: widget.padding,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          border: Border.all(
            color: _isHovered ? widget.hoverBorderColor : widget.borderColor,
            width: widget.borderWidth,
          ),
          borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: widget.hoverBorderColor.withAlpha((255 * 0.3).round()),
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                  ),
                ]
              : null,
        ),
        child: widget.child,
      ),
    );
  }
}
