import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:responsive_website/utility/constants/colors.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';
import 'package:responsive_website/utility/default_sizes/font_size.dart';
import 'package:responsive_website/utility/responsive/responsive_helper.dart';
import 'package:responsive_website/utility/responsive/responsive_widget.dart';
import 'package:responsive_website/utility/responsive/section_container.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final fonts = context.fonts;
    final s = context.sizes;

    return SectionContainer(
      // We are using the main background color from your context
      backgroundColor: DColors.background,
      padding: EdgeInsets.symmetric(vertical: s.spaceBtwSections * 2),
      child: Column(
        children: [
          // Section Title from your Figma
          Text(
            "My Experiences",
            style: fonts.displayLarge.rajdhani(
              fontSize: context.responsive(mobile: 32, tablet: 40, desktop: 48),
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: s.spaceBtwSections * 2),

          // Responsive Layout for the experience cards
          ResponsiveWidget(mobile: _buildMobileLayout(context), desktop: _buildDesktopLayout(context)),
        ],
      ),
    );
  }

  // Desktop Layout
  Widget _buildDesktopLayout(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.sizes.paddingLg),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left side: Large glass card with gradient blob
          Expanded(flex: 2, child: _buildLargeExperienceCard(context)),
          SizedBox(width: context.sizes.spaceBtwSections),
          // Right side: Grid of smaller stat cards
          Expanded(flex: 3, child: _buildStatsGrid(context)),
        ],
      ),
    );
  }

  // Mobile Layout
  Widget _buildMobileLayout(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.sizes.paddingMd),
      child: Column(
        children: [
          _buildLargeExperienceCard(context),
          SizedBox(height: context.sizes.spaceBtwSections),
          _buildStatsGrid(context, crossAxisCount: 2),
        ],
      ),
    );
  }

  // The main glass card with the gradient background
  Widget _buildLargeExperienceCard(BuildContext context) {
    final fonts = context.fonts;
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // The red gradient blob in the background
          Positioned(
            left: -50,
            bottom: -50,
            child: Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [DColors.primaryButton.withOpacity(0.6), DColors.background.withOpacity(0.1)],
                  stops: const [0.0, 1.0],
                ),
              ),
            ),
          ),
          // The glassmorphism card
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.white.withOpacity(0.1)),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "10+",
                        style: fonts.displayLarge.rajdhani(
                          fontSize: context.responsive(mobile: 48, desktop: 60),
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Years of\nExperience",
                        textAlign: TextAlign.center,
                        style: fonts.headlineSmall.rubik(color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // The grid for smaller stats
  Widget _buildStatsGrid(BuildContext context, {int crossAxisCount = 2}) {
    return GridView.count(
      crossAxisCount: crossAxisCount,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: context.sizes.spaceBtwItems,
      mainAxisSpacing: context.sizes.spaceBtwItems,
      childAspectRatio: 1.8,
      children: const [
        _StatCard(count: "50+", label: "Happy Clients"),
        _StatCard(count: "100+", label: "Projects Completed"),
        _StatCard(count: "15", label: "Countries Worldwide"),
        _StatCard(count: "5k+", label: "GitHub Commits"),
      ],
    );
  }
}

// A helper widget for the smaller stat cards
class _StatCard extends StatelessWidget {
  final String count;
  final String label;

  const _StatCard({required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    final fonts = context.fonts;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: DColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: DColors.cardBorder),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            count,
            style: fonts.headlineMedium.rajdhani(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(label, style: fonts.bodyMedium.rubik(color: DColors.textSecondary)),
        ],
      ),
    );
  }
}
