import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_website/route/route_name.dart';
import 'package:responsive_website/utility/constants/colors.dart';
import 'package:responsive_website/utility/default_sizes/font_size.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';
import 'package:responsive_website/utility/responsive/responsive_helper.dart';
import 'package:responsive_website/utility/responsive/section_container.dart';
import 'package:responsive_website/data_layer/model/blog_post_model.dart';
import 'package:responsive_website/utility/url_launcher_service/url_launcher_service.dart';

class AuthorBioSection extends StatelessWidget {
  final BlogPostModel post;

  const AuthorBioSection({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;

    return SectionContainer(
      padding: EdgeInsets.symmetric(horizontal: s.paddingMd),
      child: Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: context.responsiveValue(mobile: double.infinity, tablet: 700, desktop: 800),
          ),
          padding: EdgeInsets.all(
            context.responsiveValue(mobile: s.paddingLg, tablet: s.paddingXl, desktop: s.paddingXl * 1.5),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [DColors.cardBackground, DColors.cardBackground.withAlpha((255 * 0.5).round())],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(s.borderRadiusLg),
            border: Border.all(color: DColors.cardBorder, width: 1),
            boxShadow: [
              BoxShadow(color: Colors.black.withAlpha((255 * 0.1).round()), blurRadius: 20, offset: const Offset(0, 8)),
            ],
          ),
          child: Column(
            children: [
              // Header
              _buildHeader(context, s),
              SizedBox(height: s.spaceBtwItems),

              // Author Info
              context.isMobile ? _buildMobileLayout(context, s) : _buildDesktopLayout(context, s),
            ],
          ),
        ),
      ).animate().fadeIn(duration: 600.ms, delay: 800.ms).slideY(begin: 0.1, duration: 600.ms, delay: 800.ms),
    );
  }

  /// Header
  Widget _buildHeader(BuildContext context, DSizes s) {
    final fonts = context.fonts;

    return Row(
      children: [
        Icon(Icons.person_rounded, color: DColors.primaryButton, size: 24),
        SizedBox(width: s.paddingSm),
        Text(
          'About the Author',
          style: fonts.titleLarge.rajdhani(fontWeight: FontWeight.bold, color: DColors.textPrimary),
        ),
      ],
    );
  }

  /// Desktop/Tablet Layout
  Widget _buildDesktopLayout(BuildContext context, DSizes s) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Author Avatar
        _buildAvatar(context, s),
        SizedBox(width: s.spaceBtwItems),

        // Author Details
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAuthorName(context, s),
              SizedBox(height: s.paddingSm),
              _buildAuthorBio(context, s),
              SizedBox(height: s.spaceBtwItems),
              _buildSocialLinksAndButton(context, s),
            ],
          ),
        ),
      ],
    );
  }

  /// Mobile Layout
  Widget _buildMobileLayout(BuildContext context, DSizes s) {
    return Column(
      children: [
        // Author Avatar
        _buildAvatar(context, s),
        SizedBox(height: s.paddingMd),

        // Author Details
        _buildAuthorName(context, s),
        SizedBox(height: s.paddingSm),
        _buildAuthorBio(context, s),
        SizedBox(height: s.spaceBtwItems),
        _buildSocialLinksAndButton(context, s),
      ],
    );
  }

  /// Author Avatar
  Widget _buildAvatar(BuildContext context, DSizes s) {
    return Container(
      width: context.responsiveValue(mobile: 100.0, tablet: 120.0, desktop: 140.0),
      height: context.responsiveValue(mobile: 100.0, tablet: 120.0, desktop: 140.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: DColors.primaryButton, width: 3),
        boxShadow: [
          BoxShadow(
            color: DColors.primaryButton.withAlpha((255 * 0.3).round()),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipOval(
        child: Image.asset(
          post.authorImage,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: DColors.cardBackground,
              child: Icon(Icons.person_rounded, color: DColors.textSecondary, size: 60),
            );
          },
        ),
      ),
    );
  }

  /// Author Name
  Widget _buildAuthorName(BuildContext context, DSizes s) {
    final fonts = context.fonts;

    return Column(
      crossAxisAlignment: context.isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          post.author,
          style: fonts.headlineSmall.rajdhani(
            fontWeight: FontWeight.bold,
            color: DColors.textPrimary,
            fontSize: context.responsiveValue(mobile: 24.0, tablet: 28.0, desktop: 32.0),
          ),
          textAlign: context.isMobile ? TextAlign.center : TextAlign.left,
        ),
        SizedBox(height: 4),
        Text(
          'Flutter Developer | Cross-Platform Expert',
          style: fonts.bodyMedium.rubik(color: DColors.primaryButton, fontWeight: FontWeight.w600),
          textAlign: context.isMobile ? TextAlign.center : TextAlign.left,
        ),
      ],
    );
  }

  /// Author Bio
  Widget _buildAuthorBio(BuildContext context, DSizes s) {
    final fonts = context.fonts;

    return Text(
      post.authorBio,
      style: fonts.bodyLarge.rubik(color: DColors.textSecondary, height: 1.6),
      textAlign: context.isMobile ? TextAlign.center : TextAlign.left,
    );
  }

  /// Social Links + View All Posts Button
  Widget _buildSocialLinksAndButton(BuildContext context, DSizes s) {
    return context.isMobile
        ? Column(
            children: [
              _buildSocialLinks(context, s),
              SizedBox(height: s.paddingMd),
              _buildViewAllPostsButton(context, s),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_buildSocialLinks(context, s), _buildViewAllPostsButton(context, s)],
          );
  }

  /// Social Links
  Widget _buildSocialLinks(BuildContext context, DSizes s) {
    final socialLinks = [
      {'icon': FontAwesomeIcons.github, 'url': post.authorSocialLinks['github'] ?? ''},
      {'icon': FontAwesomeIcons.linkedin, 'url': post.authorSocialLinks['linkedin'] ?? ''},
      {'icon': FontAwesomeIcons.xTwitter, 'url': post.authorSocialLinks['twitter'] ?? ''},
    ];

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: socialLinks.map((social) {
        return Padding(
          padding: EdgeInsets.only(right: s.paddingSm),
          child: _SocialIconButton(icon: social['icon'] as IconData, url: social['url'] as String),
        );
      }).toList(),
    );
  }

  /// View All Posts Button
  Widget _buildViewAllPostsButton(BuildContext context, DSizes s) {
    return _ViewAllPostsButton(author: post.author);
  }
}

// Social Icon Button Widget
class _SocialIconButton extends StatefulWidget {
  final IconData icon;
  final String url;

  const _SocialIconButton({required this.icon, required this.url});

  @override
  State<_SocialIconButton> createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<_SocialIconButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async {
          final urlLauncher = UrlLauncherService();
          await urlLauncher.launchWebsite(widget.url);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.all(s.paddingMd),
          decoration: BoxDecoration(
            color: _isHovered
                ? DColors.primaryButton.withAlpha((255 * 0.2).round())
                : DColors.primaryButton.withAlpha((255 * 0.1).round()),
            borderRadius: BorderRadius.circular(s.borderRadiusMd),
            border: Border.all(color: _isHovered ? DColors.primaryButton : DColors.cardBorder, width: 2),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: DColors.primaryButton.withAlpha((255 * 0.3).round()),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: Icon(widget.icon, color: _isHovered ? DColors.primaryButton : DColors.textSecondary, size: 20),
        ),
      ),
    );
  }
}

// View All Posts Button Widget
class _ViewAllPostsButton extends StatefulWidget {
  final String author;

  const _ViewAllPostsButton({required this.author});

  @override
  State<_ViewAllPostsButton> createState() => _ViewAllPostsButtonState();
}

class _ViewAllPostsButtonState extends State<_ViewAllPostsButton> {
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
        onTap: () => context.go(RouteNames.blog),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(
            horizontal: context.responsiveValue(mobile: s.paddingMd, tablet: s.paddingLg, desktop: s.paddingLg),
            vertical: context.responsiveValue(mobile: s.paddingSm, tablet: s.paddingMd, desktop: s.paddingMd),
          ),
          decoration: BoxDecoration(
            gradient: _isHovered
                ? const LinearGradient(
                    colors: [DColors.primaryButton, Color(0xFFD4003D)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : null,
            color: _isHovered ? null : Colors.transparent,
            borderRadius: BorderRadius.circular(s.borderRadiusMd),
            border: Border.all(color: DColors.primaryButton, width: 2),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: DColors.primaryButton.withAlpha((255 * 0.4).round()),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ]
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'View All Posts',
                style: fonts.bodyMedium.rubik(
                  color: _isHovered ? DColors.textPrimary : DColors.primaryButton,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: s.paddingSm),
              Icon(
                Icons.arrow_forward_rounded,
                color: _isHovered ? DColors.textPrimary : DColors.primaryButton,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
