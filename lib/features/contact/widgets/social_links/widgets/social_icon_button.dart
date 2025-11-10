import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:responsive_website/utility/constants/colors.dart';
import 'package:responsive_website/utility/default_sizes/font_size.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';
import 'package:responsive_website/utility/responsive/responsive_helper.dart';
import 'package:responsive_website/data_layer/model/social_link_model.dart';

class SocialIconButton extends StatefulWidget {
  final SocialLinkModel social;

  const SocialIconButton({super.key, required this.social});

  @override
  State<SocialIconButton> createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<SocialIconButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _launchUrl(widget.social.url),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon Button with Glow Effect
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              transform: Matrix4.identity()..scale(_isHovered ? 1.15 : 1.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  if (_isHovered)
                    BoxShadow(
                      color: widget.social.color.withAlpha((255 * 0.4).round()),
                      blurRadius: 20,
                      offset: const Offset(0, 5),
                    ),
                ],
              ),
              child: Container(
                width: context.responsiveValue(mobile: 60, tablet: 65, desktop: 70),
                height: context.responsiveValue(mobile: 60, tablet: 65, desktop: 70),
                decoration: BoxDecoration(
                  color: _isHovered
                      ? widget.social.color.withAlpha((255 * 0.15).round())
                      : DColors.cardBackground,
                  shape: BoxShape.circle,
                  border: Border.all(color: _isHovered ? widget.social.color : DColors.cardBorder, width: 2),
                ),
                child: Icon(
                  widget.social.icon,
                  size: context.responsiveValue(mobile: 28, tablet: 28, desktop: 32),
                  color: _isHovered ? widget.social.color : DColors.textPrimary,
                ),
              ),
            ),
            SizedBox(height: s.paddingSm),

            // Platform Label
            Text(
              widget.social.platform,
              style: fonts.bodySmall.rubik(
                color: _isHovered ? widget.social.color : DColors.textSecondary,
                fontWeight: _isHovered ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Launch URL in external browser
  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch URL: $urlString');
    }
  }
}
