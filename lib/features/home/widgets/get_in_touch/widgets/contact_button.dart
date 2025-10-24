import 'package:flutter/material.dart';
import '../../../../../utility/constants/colors.dart';
import 'package:responsive_website/utility/default_sizes/font_size.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';
import 'package:responsive_website/utility/responsive/responsive_helper.dart';

class ContactButton extends StatefulWidget {
  const ContactButton({super.key});

  @override
  State<ContactButton> createState() => _ContactButtonState();
}

class _ContactButtonState extends State<ContactButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: SizedBox(
          width: context.isMobile ? double.infinity : 200,
          height: context.isMobile ? 40 : 50,
          child: OutlinedButton(
            onPressed: () {
              // TODO: Navigate to contact page or open email
              debugPrint('Contact button pressed');
            },
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: _isHovered ? DColors.buttonBorder : Colors.white, width: 1.5),
              backgroundColor: _isHovered
                  ? DColors.primaryButton.withAlpha((255 * 0.2).round())
                  : Colors.transparent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(s.borderRadiusSm)),
            ),
            child: Text(
              "Contact Us",
              style: fonts.bodyMedium.rubik(
                color: _isHovered ? DColors.primaryButton : DColors.textPrimary,
                fontWeight: _isHovered ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
