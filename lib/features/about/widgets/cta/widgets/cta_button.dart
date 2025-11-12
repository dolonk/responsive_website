import 'package:flutter/material.dart';
import 'package:responsive_website/utility/constants/colors.dart';
import 'package:responsive_website/utility/default_sizes/font_size.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';
import 'package:responsive_website/utility/responsive/responsive_helper.dart';

enum CTAButtonType { primary, secondary }

class CTAButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final CTAButtonType type;
  final IconData? icon;

  const CTAButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.type = CTAButtonType.primary,
    this.icon,
  });

  @override
  State<CTAButton> createState() => _CTAButtonState();
}

class _CTAButtonState extends State<CTAButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;

    final isPrimary = widget.type == CTAButtonType.primary;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          transform: Matrix4.identity()..scale(_isHovered ? 1.05 : 1.0),
          padding: EdgeInsets.symmetric(
            horizontal: context.responsiveValue(
              mobile: s.paddingLg,
              tablet: s.paddingXl,
              desktop: s.paddingXl,
            ),
            vertical: s.paddingMd,
          ),
          decoration: BoxDecoration(
            gradient: isPrimary
                ? LinearGradient(
                    colors: [DColors.primaryButton, DColors.primaryButton.withAlpha((255 * 0.8).round())],
                  )
                : null,
            color: isPrimary ? null : Colors.transparent,
            borderRadius: BorderRadius.circular(s.borderRadiusLg),
            border: Border.all(color: DColors.primaryButton, width: 2),
            boxShadow: [
              if (_isHovered)
                BoxShadow(
                  color: DColors.primaryButton.withAlpha((255 * 0.4).round()),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null) ...[
                Icon(widget.icon, color: isPrimary ? Colors.white : DColors.primaryButton, size: 22),
                SizedBox(width: s.paddingSm),
              ],
              Text(
                widget.text,
                style: fonts.bodyLarge.rubik(
                  color: isPrimary ? Colors.white : DColors.primaryButton,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
