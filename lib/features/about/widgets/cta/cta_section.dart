import 'widgets/cta_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_website/utility/constants/colors.dart';
import 'package:responsive_website/utility/default_sizes/font_size.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';
import 'package:responsive_website/utility/responsive/responsive_helper.dart';
import 'package:responsive_website/utility/responsive/section_container.dart';
import 'package:responsive_website/common_function/style/animation_social_icon.dart';
import 'package:responsive_website/features/about/widgets/cta/widgets/floating_shapes.dart';

class CTASection extends StatelessWidget {
  const CTASection({super.key});

  Future<void> _downloadCV(BuildContext context) async {
    const String cvUrl = 'assets/files/dolon_kumar_cv.pdf';

    // For web, you can use a direct link to your CV hosted online
    // const String cvUrl = 'https://yourwebsite.com/cv/dolon_kumar_cv.pdf';

    try {
      final Uri url = Uri.parse(cvUrl);
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('CV download coming soon!'), backgroundColor: Colors.orange),
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('CV download coming soon!'), backgroundColor: Colors.orange),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;

    return SectionContainer(
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.zero,
      child: Stack(
        children: [
          // Gradient Background
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: s.paddingMd, vertical: s.spaceBtwSections),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFF8B5CF6).withAlpha((255 * 0.15).round()),
                  const Color(0xFF3B82F6).withAlpha((255 * 0.15).round()),
                ],
              ),
            ),
            child: Center(
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: context.responsiveValue(mobile: double.infinity, tablet: 700, desktop: 800),
                ),
                child: Column(
                  children: [
                    // Heading
                    _buildHeading(context, s),
                    SizedBox(height: s.spaceBtwItems),

                    // Subtext
                    _buildSubtext(context, s),
                    SizedBox(height: s.spaceBtwSections),

                    // CTA Buttons
                    _buildCTAButtons(context, s),
                    SizedBox(height: s.spaceBtwSections),

                    // Social Links
                    AnimationSocialIcon(),
                  ],
                ),
              ),
            ),
          ),

          // Floating Shapes Decoration
          const Positioned.fill(child: FloatingShapes()),
        ],
      ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.1, duration: 800.ms),
    );
  }

  /// Heading
  Widget _buildHeading(BuildContext context, DSizes s) {
    final fonts = context.fonts;

    return Text('Ready to Work Together?', style: fonts.headlineLarge, textAlign: TextAlign.center)
        .animate()
        .fadeIn(duration: 600.ms, delay: 200.ms)
        .scale(begin: const Offset(0.95, 0.95), duration: 600.ms, delay: 200.ms);
  }

  /// Subtext
  Widget _buildSubtext(BuildContext context, DSizes s) {
    final fonts = context.fonts;

    return Text(
      'Let\'s build something amazing together. I\'m available for freelance projects, full-time opportunities, and collaborations. Whether you need a Flutter expert or a problem-solver, I\'m here to help.',
      style: fonts.bodyLarge.rubik(color: DColors.textSecondary),
      textAlign: TextAlign.center,
    ).animate().fadeIn(duration: 600.ms, delay: 300.ms);
  }

  /// CTA Buttons
  Widget _buildCTAButtons(BuildContext context, DSizes s) {
    return Wrap(
      spacing: s.paddingLg,
      runSpacing: s.paddingMd,
      alignment: WrapAlignment.center,
      children: [
        // Primary Button - Get in Touch
        CTAButton(
              text: 'Get in Touch',
              icon: Icons.mail_outline_rounded,
              type: CTAButtonType.primary,
              onPressed: () {
                // Navigate to Contact page
                context.go('/contact');
              },
            )
            .animate()
            .fadeIn(duration: 500.ms, delay: 400.ms)
            .scale(begin: const Offset(0.9, 0.9), duration: 500.ms, delay: 400.ms),

        // Secondary Button - Download CV
        CTAButton(
              text: 'Download CV',
              icon: Icons.download_rounded,
              type: CTAButtonType.secondary,
              onPressed: () => _downloadCV(context),
            )
            .animate()
            .fadeIn(duration: 500.ms, delay: 500.ms)
            .scale(begin: const Offset(0.9, 0.9), duration: 500.ms, delay: 500.ms),
      ],
    );
  }
}
