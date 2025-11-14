import 'package:flutter/material.dart';
import 'widgets/floating_icon.dart';
import 'widgets/platform_badge.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_website/utility/default_sizes/font_size.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';
import 'package:responsive_website/utility/responsive/responsive_helper.dart';
import 'widgets/billing_toggle.dart';

import 'package:responsive_website/utility/constants/colors.dart';
import 'package:responsive_website/utility/responsive/section_container.dart';

class PricingHeroSectionD extends StatefulWidget {
  const PricingHeroSectionD({super.key});

  @override
  State<PricingHeroSectionD> createState() => _PricingHeroSectionStateD();
}

class _PricingHeroSectionStateD extends State<PricingHeroSectionD> with TickerProviderStateMixin {
  late AnimationController _gradientController;
  late Animation<double> _gradientAnimation;

  @override
  void initState() {
    super.initState();

    // Gradient shift animation (infinite)
    _gradientController = AnimationController(duration: const Duration(seconds: 8), vsync: this)
      ..repeat(reverse: true);

    _gradientAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _gradientController, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _gradientController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;

    return AnimatedBuilder(
      animation: _gradientAnimation,
      builder: (context, child) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: s.paddingMd, vertical: s.spaceBtwSections),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF8B5CF6), // Purple
                Color(0xFFEC4899), // Pink
                Color(0xFF3B82F6), // Blue
              ],
              stops: [0.0 + (_gradientAnimation.value * 0.1), 0.5 + (_gradientAnimation.value * 0.1), 1.0],
            ),
          ),
          child: Stack(
            children: [
              // Floating decorative icons
              _buildFloatingIcons(),

              // Main content
              Center(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: context.responsiveValue(mobile: double.infinity, tablet: 700, desktop: 900),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Main Heading
                      _buildHeading(fonts, s),
                      SizedBox(height: s.paddingMd),

                      // Gradient underline decoration
                      _buildUnderlineDecoration(),
                      SizedBox(height: s.spaceBtwItems),

                      // Subheading
                      _buildSubheading(fonts, s),
                      SizedBox(height: s.paddingSm),

                      // Description
                      _buildDescription(fonts, s),
                      SizedBox(height: s.spaceBtwSections),

                      // Platform badges
                      _buildPlatformBadges(s),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// Floating decorative icons (diamond, star, etc.)
  Widget _buildFloatingIcons() {
    return Column(
      children: [
        // Top Left - Diamond
        Positioned(top: 20, left: 30, child: FloatingIcon(icon: '💎', delay: 0)),

        // Top Right - Star
        Positioned(top: 40, right: 50, child: FloatingIcon(icon: '⭐', delay: 200)),

        // Bottom Left - Sparkle
        Positioned(bottom: 60, left: 60, child: FloatingIcon(icon: '✨', delay: 400)),

        // Bottom Right - Trophy
        Positioned(bottom: 40, right: 40, child: FloatingIcon(icon: '🏆', delay: 600)),
      ],
    );
  }

  /// Main heading text
  Widget _buildHeading(AppFonts fonts, DSizes s) {
    return Text(
          'Transparent Pricing Plans',
          style: fonts.displayLarge.rajdhani(
            fontSize: context.responsiveValue(mobile: 36, tablet: 44, desktop: 52),
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        )
        .animate()
        .fadeIn(duration: 600.ms)
        .slideY(begin: 0.2, end: 0, duration: 600.ms)
        .then()
        .shimmer(duration: 1500.ms, color: Colors.white.withAlpha((255 * 0.3).round()));
  }

  /// Gradient animated underline
  Widget _buildUnderlineDecoration() {
    return Container(
      height: 4,
      width: context.responsiveValue(mobile: 100, tablet: 150, desktop: 200),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.white]),
        borderRadius: BorderRadius.circular(2),
        boxShadow: [
          BoxShadow(color: Colors.white.withAlpha((255 * 0.5).round()), blurRadius: 10, offset: Offset(0, 2)),
        ],
      ),
    ).animate().scaleX(begin: 0, duration: 800.ms, delay: 400.ms, curve: Curves.easeOut);
  }

  /// Subheading text
  Widget _buildSubheading(AppFonts fonts, DSizes s) {
    return Text(
      'Investment in quality, delivered with care',
      style: fonts.titleLarge.rubik(
        fontSize: context.responsiveValue(mobile: 18, tablet: 20, desktop: 22),
        fontWeight: FontWeight.w500,
        color: Colors.white.withAlpha((255 * 0.95).round()),
      ),
      textAlign: TextAlign.center,
    ).animate(delay: 200.ms).fadeIn(duration: 600.ms).slideY(begin: 0.2, end: 0, duration: 600.ms);
  }

  /// Description text
  Widget _buildDescription(AppFonts fonts, DSizes s) {
    return Text(
      'Choose the perfect package for your project needs.\nNo hidden fees, transparent pricing, flexible terms.',
      style: fonts.bodyLarge.rubik(
        fontSize: context.responsiveValue(mobile: 14, tablet: 16, desktop: 18),
        color: Colors.white.withAlpha((255 * 0.85).round()),
        height: 1.6,
      ),
      textAlign: TextAlign.center,
    ).animate(delay: 400.ms).fadeIn(duration: 600.ms).slideY(begin: 0.2, end: 0, duration: 600.ms);
  }

  /// Platform badges (Mobile, Web, Desktop)
  Widget _buildPlatformBadges(DSizes s) {
    final platforms = [
      {'icon': Icons.smartphone_rounded, 'label': 'Mobile'},
      {'icon': Icons.web_rounded, 'label': 'Web'},
      {'icon': Icons.desktop_windows_rounded, 'label': 'Desktop'},
    ];

    return Wrap(
      spacing: s.spaceBtwItems,
      runSpacing: s.paddingMd,
      alignment: WrapAlignment.center,
      children: platforms.asMap().entries.map((entry) {
        final index = entry.key;
        final platform = entry.value;

        return PlatformBadge(
          icon: platform['icon'] as IconData,
          label: platform['label'] as String,
          delay: 600 + (index * 150),
        );
      }).toList(),
    );
  }
}



class PricingHeroSection extends StatelessWidget {
  final bool isYearly;
  final Function(bool) onBillingChanged;

  const PricingHeroSection({super.key, required this.isYearly, required this.onBillingChanged});

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;

    return SectionContainer(
      padding: EdgeInsets.symmetric(horizontal: s.paddingMd, vertical: s.spaceBtwSections),
      child: Column(
        children: [
          // Heading
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [DColors.textPrimary, DColors.primaryButton, Color(0xFF8B5CF6)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds),
            child: Text(
              'Choose the Perfect Plan',
              style: fonts.displayMedium.rajdhani(
                fontSize: context.responsiveValue(mobile: 32.0, tablet: 42.0, desktop: 52.0),
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1.2,
              ),
              textAlign: TextAlign.center,
            ),
          ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2, duration: 600.ms),

          SizedBox(height: s.paddingMd),

          // Subheading
          Text(
                'Transparent pricing. No hidden fees. Cancel anytime.',
                style: fonts.bodyLarge.rubik(
                  color: DColors.textSecondary,
                  fontSize: context.responsiveValue(mobile: 14.0, tablet: 16.0, desktop: 18.0),
                  height: 1.6,
                ),
                textAlign: TextAlign.center,
              )
              .animate()
              .fadeIn(duration: 600.ms, delay: 200.ms)
              .slideY(begin: 0.2, duration: 600.ms, delay: 200.ms),

          SizedBox(height: s.spaceBtwItems),

          // Billing Toggle
          BillingToggle(isYearly: isYearly, onChanged: onBillingChanged)
              .animate()
              .fadeIn(duration: 600.ms, delay: 400.ms)
              .scale(begin: const Offset(0.9, 0.9), duration: 600.ms, delay: 400.ms),
        ],
      ),
    );
  }
}
