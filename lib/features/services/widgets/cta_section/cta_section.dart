import 'package:flutter/material.dart';
import 'package:responsive_website/utility/constants/colors.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';
import 'package:responsive_website/utility/default_sizes/font_size.dart';
import 'package:responsive_website/utility/responsive/responsive_helper.dart';

class CtaSection extends StatelessWidget {
  const CtaSection({super.key});

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: s.paddingMd, vertical: s.spaceBtwSections),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF1E293B),
            const Color(0xFF0F172A),
            DColors.primaryButton.withAlpha((255 * 0.3).round()),
          ],
        ),
      ),
      child: Stack(
        children: [
          // Top-left circle
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [DColors.primaryButton.withAlpha((255 * 0.2).round()), Colors.transparent],
                ),
              ),
            ),
          ),
          // Main content
          _buildContentCard(context, s),
        ],
      ),
    );
  }

  /// Main Content Card (3D Style)
  Widget _buildContentCard(BuildContext context, DSizes s) {
    final fonts = context.fonts;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Heading
        Text(
          'Ready to Start Your Project?',
          style: fonts.displayMedium.rajdhani(
            fontSize: context.responsiveValue(mobile: 28, tablet: 40, desktop: 48),
            fontWeight: FontWeight.bold,
            color: Colors.white,
            height: 1.2,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: s.spaceBtwItems),

        // Subheading
        Text(
          'Let\'s discuss your ideas and turn them into reality',
          style: fonts.bodyLarge.rubik(
            color: Colors.white.withAlpha((255 * 0.9).round()),
            fontSize: context.responsiveValue(mobile: 16, tablet: 18, desktop: 20),
            height: 1.6,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: s.spaceBtwItems),

        // Additional info
        Container(
          padding: EdgeInsets.symmetric(horizontal: s.paddingMd, vertical: s.paddingSm),
          decoration: BoxDecoration(
            color: DColors.primaryButton.withAlpha((255 * 0.15).round()),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.schedule_rounded, color: DColors.primaryButton, size: 18),
              SizedBox(width: s.paddingSm),
              Flexible(
                child: Text(
                  'Free 30-minute consultation • No commitment required',
                  style: fonts.labelMedium.rubik(
                    color: Colors.white.withAlpha((255 * 0.95).round()),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: s.spaceBtwSections),

        // Buttons
        _buildButtons(context, s, fonts),
        SizedBox(height: s.spaceBtwSections),

        // Bottom note
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.verified_rounded, color: DColors.serviceGreen, size: 18),
            SizedBox(width: s.paddingSm),
            Text(
              'Trusted by 30+ clients worldwide',
              style: fonts.labelSmall.rubik(color: Colors.white.withAlpha((255 * 0.7).round())),
            ),
          ],
        ),
      ],
    );
  }

  /// CTA Buttons with Glow Effect
  Widget _buildButtons(BuildContext context, DSizes s, AppFonts fonts) {
    if (context.isMobile) {
      // Mobile: Stacked vertically
      return Column(
        children: [
          _buildPrimaryButton(context, s, fonts),
          SizedBox(height: s.paddingMd),
          _buildSecondaryButton(context, s, fonts),
        ],
      );
    } else {
      // Tablet & Desktop: Side by side
      return Wrap(
        spacing: s.paddingLg,
        runSpacing: s.paddingMd,
        alignment: WrapAlignment.center,
        children: [_buildPrimaryButton(context, s, fonts), _buildSecondaryButton(context, s, fonts)],
      );
    }
  }

  /// Primary Button - Schedule Consultation (Glowing)
  Widget _buildPrimaryButton(BuildContext context, DSizes s, AppFonts fonts) {
    return _GlowingButton(
      onPressed: () {
        debugPrint('Schedule Free Consultation clicked');
      },
      backgroundColor: DColors.primaryButton,
      foregroundColor: Colors.white,
      glowColor: DColors.primaryButton,
      icon: Icons.calendar_today_rounded,
      label: 'Schedule Free Call',
      isFullWidth: context.isMobile,
      padding: EdgeInsets.symmetric(horizontal: s.paddingLg, vertical: s.paddingMd),
      fontSize: fonts.labelLarge,
    );
  }

  /// Secondary Button - Contact Us
  Widget _buildSecondaryButton(BuildContext context, DSizes s, AppFonts fonts) {
    return _GlowingButton(
      onPressed: () {
        debugPrint('Contact Us clicked');
      },
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.white,
      glowColor: Colors.white,
      icon: Icons.email_rounded,
      label: 'Contact Us',
      isOutlined: true,
      isFullWidth: context.isMobile,
      padding: EdgeInsets.symmetric(horizontal: s.paddingLg, vertical: s.paddingMd),
      fontSize: fonts.labelLarge,
    );
  }
}

/// 🌟 Glowing Button Widget with Hover Animation
class _GlowingButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color glowColor;
  final IconData icon;
  final String label;
  final bool isOutlined;
  final bool isFullWidth;
  final EdgeInsets padding;
  final TextStyle fontSize;

  const _GlowingButton({
    required this.onPressed,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.glowColor,
    required this.icon,
    required this.label,
    this.isOutlined = false,
    this.isFullWidth = false,
    required this.padding,
    required this.fontSize,
  });

  @override
  State<_GlowingButton> createState() => _GlowingButtonState();
}

class _GlowingButtonState extends State<_GlowingButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            if (_isHovered)
              BoxShadow(
                color: widget.glowColor.withAlpha((255 * 0.5).round()),
                blurRadius: 25,
                offset: const Offset(0, 8),
              ),
          ],
        ),
        child: SizedBox(
          width: widget.isFullWidth ? double.infinity : null,
          child: widget.isOutlined
              ? OutlinedButton(
                  onPressed: widget.onPressed,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: widget.foregroundColor,
                    side: BorderSide(color: widget.foregroundColor, width: 2),
                    padding: widget.padding,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(widget.icon, size: 20),
                      const SizedBox(width: 8),
                      Text(widget.label, style: widget.fontSize.rubik(fontWeight: FontWeight.bold)),
                    ],
                  ),
                )
              : ElevatedButton(
                  onPressed: widget.onPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: widget.backgroundColor,
                    foregroundColor: widget.foregroundColor,
                    padding: widget.padding,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    elevation: _isHovered ? 12 : 4,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(widget.icon, size: 20),
                      const SizedBox(width: 8),
                      Text(widget.label, style: widget.fontSize.rubik(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
