import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:responsive_website/utility/constants/colors.dart';
import 'package:responsive_website/utility/default_sizes/font_size.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';
import 'package:responsive_website/utility/responsive/responsive_helper.dart';
import 'package:responsive_website/utility/responsive/section_container.dart';
import 'package:responsive_website/data_layer/model/social_link_model.dart';
import 'widgets/social_icon_button.dart';

class SocialLinksSection extends StatelessWidget {
  const SocialLinksSection({super.key});

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;

    return SectionContainer(
      padding: EdgeInsets.symmetric(horizontal: s.paddingMd, vertical: s.spaceBtwSections),
      child: Column(
        children: [
          // Section Heading
          _buildSectionHeading(context, s),
          SizedBox(height: s.spaceBtwSections),

          // Social Icons Grid
          _buildSocialIconsGrid(context, s),
        ],
      ),
    );
  }

  /// Section Heading
  Widget _buildSectionHeading(BuildContext context, DSizes s) {
    final fonts = context.fonts;

    return Column(
      children: [
        Text(
          'Connect With Me',
          style: fonts.headlineLarge.rajdhani(
            fontSize: context.responsiveValue(mobile: 28, tablet: 32, desktop: 36),
            fontWeight: FontWeight.bold,
            color: DColors.textPrimary,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: s.paddingSm),
        Container(
          constraints: BoxConstraints(
            maxWidth: context.responsiveValue(mobile: double.infinity, tablet: 600, desktop: 700),
          ),
          child: Text(
            'Follow for updates, tips, and insights on Flutter development',
            style: fonts.bodyLarge.rubik(color: DColors.textSecondary, height: 1.6),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.1, duration: 600.ms);
  }

  /// Social Icons Grid with Staggered Animation
  Widget _buildSocialIconsGrid(BuildContext context, DSizes s) {
    final socialLinks = _getSocialLinks();
    final spacing = context.responsiveValue(mobile: s.paddingMd, tablet: s.paddingLg, desktop: s.paddingLg);

    return AnimationLimiter(
      child: Wrap(
        spacing: spacing,
        runSpacing: spacing,
        alignment: WrapAlignment.center,
        children: List.generate(socialLinks.length, (index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 400),
            child: ScaleAnimation(
              scale: 0.5,
              child: FadeInAnimation(child: SocialIconButton(social: socialLinks[index])),
            ),
          );
        }),
      ),
    ).animate(delay: 300.ms).fadeIn(duration: 600.ms);
  }

  /// Get Social Links Data
  List<SocialLinkModel> _getSocialLinks() {
    return [
      // GitHub
      SocialLinkModel(
        platform: 'GitHub',
        url: 'https://github.com/your-username',
        icon: FontAwesomeIcons.github,
        color: const Color(0xFF181717), // GitHub dark gray
      ),

      // LinkedIn
      SocialLinkModel(
        platform: 'LinkedIn',
        url: 'https://www.linkedin.com/in/your-profile',
        icon: FontAwesomeIcons.linkedin,
        color: const Color(0xFF0A66C2), // LinkedIn blue
      ),

      // Twitter/X
      SocialLinkModel(
        platform: 'Twitter',
        url: 'https://twitter.com/your-handle',
        icon: FontAwesomeIcons.twitter,
        color: const Color(0xFF1DA1F2),
      ),

      // YouTube
      SocialLinkModel(
        platform: 'YouTube',
        url: 'https://www.youtube.com/@your-channel',
        icon: FontAwesomeIcons.youtube,
        color: const Color(0xFFFF0000), // YouTube red
      ),

      // Medium or Dev.to (Choose one or add both)
      SocialLinkModel(
        platform: 'Medium',
        url: 'https://medium.com/@your-username',
        icon: FontAwesomeIcons.medium,
        color: const Color(0xFF000000), // Medium black
      ),

      // Optional: Dev.to
      // SocialLinkModel(
      //   platform: 'Dev.to',
      //   url: 'https://dev.to/your-username',
      //   icon: FontAwesomeIcons.dev,
      //   color: const Color(0xFF0A0A0A),
      // ),
    ];
  }
}
