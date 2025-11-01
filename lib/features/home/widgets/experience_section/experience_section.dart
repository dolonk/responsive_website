import 'package:flutter/material.dart';
import 'package:responsive_website/utility/constants/colors.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';
import 'package:responsive_website/utility/responsive/responsive_widget.dart';
import 'package:responsive_website/utility/responsive/section_container.dart';
import 'package:responsive_website/common_function/style/section_header.dart';
import 'package:responsive_website/utility/responsive/responsive_helper.dart';
import 'package:responsive_website/features/home/widgets/experience_section/widgets/start_card.dart';
import 'package:responsive_website/features/home/widgets/experience_section/widgets/year_card.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;

    return SectionContainer(
      backgroundColor: DColors.background,
      padding: EdgeInsets.only(top: s.spaceBtwSections, left: s.paddingMd, right: s.paddingMd),
      child: Column(
        children: [
          _buildSectionHeader(),
          SizedBox(height: s.spaceBtwItems),
          ResponsiveWidget(
            mobile: _buildMobileLayout(context),
            tablet: _buildTabletLayout(context),
            desktop: _buildDesktopLayout(context),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader() {
    return const SectionHeader(
      subtitle: 'Journey & Achievements',
      title: 'Experience & Milestones',
      description: 'Building innovative solutions with 3+ years of expertise in cross-platform development',
    );
  }

  // 📱 MOBILE LAYOUT
  Widget _buildMobileLayout(BuildContext context) {
    final s = context.sizes;
    return Column(
      children: [
        _buildStatsSection(context, isMobile: true),
        SizedBox(height: s.spaceBtwItems),

        _buildTimelineSection(context, isVertical: true),
      ],
    );
  }

  // 📱 TABLET LAYOUT
  Widget _buildTabletLayout(BuildContext context) {
    final s = context.sizes;
    return Column(
      children: [
        _buildStatsSection(context, isMobile: false),
        SizedBox(height: s.spaceBtwItems),

        _buildTimelineSection(context, isVertical: false),
      ],
    );
  }

  // 💻 DESKTOP LAYOUT
  Widget _buildDesktopLayout(BuildContext context) {
    final s = context.sizes;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 6, child: _buildStatsSection(context, isMobile: false)),
        SizedBox(width: s.spaceBtwItems *2),

        Expanded(flex: 4, child: _buildTimelineSection(context, isVertical: true)),
      ],
    );
  }

  // STATS SECTION
  Widget _buildStatsSection(BuildContext context, {required bool isMobile}) {
    final s = context.sizes;
    final stats = [
      {'icon': '📱', 'number': 50, 'title': 'Projects Completed'},
      {'icon': '⭐', 'number': 30, 'title': 'Happy Clients'},
      {'icon': '🚀', 'number': 4, 'title': 'Platforms Mastered'},
      {'icon': '💯', 'number': 98, 'title': 'Client Satisfaction'},
    ];

    if (isMobile) {
      // Mobile: Vertical stack with aspect ratio
      return Column(
        children: List.generate(stats.length, (index) {
          final stat = stats[index];
          return Padding(
            padding: EdgeInsets.only(bottom: index < stats.length - 1 ? s.spaceBtwItems : 0),
            child: AspectRatio(
              aspectRatio: 2.5, // Width:Height ratio
              child: StartCard(
                icon: stat['icon'] as String,
                number: stat['number'] as int,
                title: stat['title'] as String,
                index: index,
              ),
            ),
          );
        }),
      );
    }

    // Tablet/Desktop: 2x2 Grid with Wrap
    return LayoutBuilder(
      builder: (context, constraints) {
        final spacing = s.spaceBtwItems;
        final cardWidth = (constraints.maxWidth - spacing) / 2;

        final aspectRatio = context.isTablet ? 1.6 : 1.4;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: List.generate(stats.length, (index) {
            final stat = stats[index];
            return SizedBox(
              width: cardWidth,
              child: AspectRatio(
                aspectRatio: aspectRatio,
                child: StartCard(
                  icon: stat['icon'] as String,
                  number: stat['number'] as int,
                  title: stat['title'] as String,
                  index: index,
                ),
              ),
            );
          }),
        );
      },
    );
  }

  // TIMELINE SECTION
  Widget _buildTimelineSection(BuildContext context, {required bool isVertical}) {
    final timelineData = [
      {'year': 2022, 'description': 'Started Flutter Development Journey with First Production App'},
      {'year': 2023, 'description': 'Built 20+ Cross-Platform Apps for Startups & Enterprises'},
      {'year': 2024, 'description': 'Achieved Senior Developer Status with Advanced Architecture Skills'},
      {'year': 2025, 'description': 'Leading Enterprise Projects & Mentoring Junior Developers'},
    ];

    // Mobile & Desktop: Vertical timeline
    if (isVertical) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(timelineData.length, (index) {
          final data = timelineData[index];
          return YearCard(
            year: data['year'] as int,
            description: data['description'] as String,
            index: index,
          );
        }),
      );
    }

    // Tablet: Horizontal scroll
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(timelineData.length, (index) {
          final data = timelineData[index];
          return YearCard(
            year: data['year'] as int,
            description: data['description'] as String,
            index: index,
          );
        }),
      ),
    );
  }
}
