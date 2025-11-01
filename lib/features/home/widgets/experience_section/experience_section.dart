import 'package:flutter/material.dart';
import 'package:responsive_website/utility/default_sizes/font_size.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';
import 'package:responsive_website/utility/responsive/responsive_widget.dart';
import 'package:responsive_website/utility/responsive/section_container.dart';
import 'package:responsive_website/features/home/widgets/experience_section/widgets/start_card.dart';
import 'package:responsive_website/features/home/widgets/experience_section/widgets/year_card.dart';

import '../../../../utility/constants/colors.dart';

/*class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;

    return SectionContainer(
      padding: EdgeInsets.symmetric(vertical: s.spaceBtwSections, horizontal: context.sizes.paddingLg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Section Title
          Text("My Experiences", style: fonts.displayLarge),
          SizedBox(height: s.spaceBtwItems),

          // Responsive Layout
          ResponsiveWidget(
            mobile: _buildMobileLayout(context),
            tablet: _buildTabletLayout(context),
            desktop: _buildDesktopLayout(context),
          ),
        ],
      ),
    );
  }

  // 📱 Mobile Layout
  Widget _buildMobileLayout(BuildContext context) {
    final s = context.sizes;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: s.paddingMd),
      child: Column(
        children: [
          YearsCard(),
          SizedBox(height: s.spaceBtwSections),
          StatCard(title: "10+", subtitle: "Mobile Apps Published"),
          SizedBox(height: s.spaceBtwItems),
          StatCard(title: "20+", subtitle: "Client Projects Delivered"),
          SizedBox(height: s.spaceBtwItems),
          StatCard(title: "Flutter Expert", subtitle: "Android • iOS • Web • macOS • Windows"),
          SizedBox(height: s.spaceBtwItems),
          StatCard(title: "UI/UX Focused", subtitle: "Pixel Perfect Design"),
        ],
      ),
    );
  }

  // 📱 Tablet Layout
  Widget _buildTabletLayout(BuildContext context) {
    final s = context.sizes;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: s.paddingMd),
      child: Column(
        children: [
          YearsCard(),
          SizedBox(height: s.spaceBtwSections),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: s.spaceBtwItems,
            crossAxisSpacing: s.spaceBtwItems,
            childAspectRatio: 1.6,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              StatCard(title: "10+", subtitle: "Mobile Apps Published"),
              StatCard(title: "20+", subtitle: "Client Projects Delivered"),
              StatCard(title: "Flutter Expert", subtitle: "Android • iOS • Web • macOS • Windows"),
              StatCard(title: "UI/UX Focused", subtitle: "Pixel Perfect Design"),
            ],
          ),
        ],
      ),
    );
  }

  // 💻 Desktop Layout (Improved Responsive Version)
  Widget _buildDesktopLayout(BuildContext context) {
    final s = context.sizes;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 60,
              bottom: -80,
              child: Container(
                width: 250,
                height: 240,
                decoration: BoxDecoration(shape: BoxShape.circle, gradient: DColors.pinkGradient),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: s.spaceBtwSections * 4),
              child: YearsCard(),
            ),
          ],
        ),

        // publish card
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // First Row
            Row(
              children: [
                StatCard(title: "10+", subtitle: "Mobile Apps Published"),
                SizedBox(width: s.spaceBtwSections),
                StatCard(title: "20+", subtitle: "Client Projects Delivered"),
              ],
            ),
            SizedBox(height: s.paddingSm),

            // Second Row
            Row(
              children: [
                StatCard(title: "Flutter Expert", subtitle: "Android • iOS • Web • macOS • Windows"),
                SizedBox(width: s.spaceBtwSections),
                StatCard(title: "UI/UX Focused", subtitle: "Pixel Perfect Design"),
              ],
            ),
          ],
        ),
      ],
    );
  }
}*/

import 'package:responsive_website/common_function/style/section_header.dart';
import 'package:responsive_website/utility/responsive/responsive_helper.dart';

import 'package:flutter/material.dart';
import 'package:responsive_website/common_function/style/section_header.dart';
import 'package:responsive_website/utility/constants/colors.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';
import 'package:responsive_website/utility/responsive/responsive_helper.dart';
import 'package:responsive_website/utility/responsive/responsive_widget.dart';
import 'package:responsive_website/utility/responsive/section_container.dart';
import 'package:responsive_website/features/home/widgets/experience_section/widgets/start_card.dart';
import 'package:responsive_website/features/home/widgets/experience_section/widgets/year_card.dart';

import 'package:flutter/material.dart';
import 'package:responsive_website/common_function/style/section_header.dart';
import 'package:responsive_website/utility/constants/colors.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';
import 'package:responsive_website/utility/responsive/responsive_helper.dart';
import 'package:responsive_website/utility/responsive/responsive_widget.dart';
import 'package:responsive_website/utility/responsive/section_container.dart';
import 'package:responsive_website/features/home/widgets/experience_section/widgets/start_card.dart';
import 'package:responsive_website/features/home/widgets/experience_section/widgets/year_card.dart';

import 'package:flutter/material.dart';
import 'package:responsive_website/common_function/style/section_header.dart';
import 'package:responsive_website/utility/constants/colors.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';
import 'package:responsive_website/utility/responsive/responsive_helper.dart';
import 'package:responsive_website/utility/responsive/responsive_widget.dart';
import 'package:responsive_website/utility/responsive/section_container.dart';
import 'package:responsive_website/features/home/widgets/experience_section/widgets/start_card.dart';
import 'package:responsive_website/features/home/widgets/experience_section/widgets/year_card.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;

    return SectionContainer(
      backgroundColor: DColors.background,
      padding: EdgeInsets.symmetric(vertical: s.spaceBtwSections, horizontal: s.paddingLg),
      child: Column(
        children: [
          _buildSectionHeader(),
          SizedBox(height: s.spaceBtwSections * 1.5),
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

  Widget _buildMobileLayout(BuildContext context) {
    final s = context.sizes;
    return Column(
      children: [
        _buildStatsSection(context, isMobile: true),
        SizedBox(height: s.spaceBtwSections * 1.5),
        _buildTimelineSection(context, isVertical: true),
      ],
    );
  }

  Widget _buildTabletLayout(BuildContext context) {
    final s = context.sizes;
    return Column(
      children: [
        _buildStatsSection(context, isMobile: false),
        SizedBox(height: s.spaceBtwSections * 1.5),
        _buildTimelineSection(context, isVertical: false),
      ],
    );
  }

  // 💻 DESKTOP LAYOUT (CORRECTED)
  Widget _buildDesktopLayout(BuildContext context) {
    final s = context.sizes;
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(flex: 5, child: _buildStatsSection(context, isMobile: false)),
          SizedBox(width: s.spaceBtwSections),
          Expanded(flex: 4, child: _buildTimelineGrid(context)),
        ],
      ),
    );
  }

  // STATS SECTION (LOGIC CORRECTED)
  Widget _buildStatsSection(BuildContext context, {required bool isMobile}) {
    final s = context.sizes;
    final stats = [
      {'icon': '📱', 'number': 50, 'title': 'Projects Completed'},
      {'icon': '⭐', 'number': 30, 'title': 'Happy Clients'},
      {'icon': '🚀', 'number': 4, 'title': 'Platforms Mastered'},
      {'icon': '💯', 'number': 98, 'title': 'Client Satisfaction'},
    ];

    if (isMobile) {
      return Column(
        children: List.generate(stats.length, (index) {
          final stat = stats[index];
          return Padding(
            padding: EdgeInsets.only(bottom: index < stats.length - 1 ? s.spaceBtwItems : 0),
            child: StartCard(
              icon: stat['icon'] as String,
              number: stat['number'] as int,
              title: stat['title'] as String,
              index: index,
            ),
          );
        }),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final spacing = s.spaceBtwItems;
        // Correctly calculate width and height for 2 columns
        final cardWidth = (constraints.maxWidth - spacing) / 2;
        final cardHeight = context.isTablet ? cardWidth / 1.8 : cardWidth / 1.6;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: List.generate(stats.length, (index) {
            final stat = stats[index];
            return SizedBox(
              // Use calculated width and height instead of hardcoded values
              width: cardWidth,
              height: cardHeight,
              child: StartCard(
                icon: stat['icon'] as String,
                number: stat['number'] as int,
                title: stat['title'] as String,
                index: index,
              ),
            );
          }),
        );
      },
    );
  }

  // TIMELINE SECTION
  Widget _buildTimelineSection(BuildContext context, {required bool isVertical}) {
    final s = context.sizes;
    final timelineData = [
      {'year': 2022, 'description': 'Started Flutter Development Journey with First Production App'},
      {'year': 2023, 'description': 'Built 20+ Cross-Platform Apps for Startups & Enterprises'},
      {'year': 2024, 'description': 'Achieved Senior Developer Status with Advanced Architecture Skills'},
      {'year': 2025, 'description': 'Leading Enterprise Projects & Mentoring Junior Developers'},
    ];

    if (isVertical) {
      return Column(
        children: List.generate(timelineData.length, (index) {
          final data = timelineData[index];
          return Padding(
            padding: EdgeInsets.only(bottom: index < timelineData.length - 1 ? s.spaceBtwItems : 0),
            child: YearCard(year: data['year'] as int, description: data['description'] as String, index: index),
          );
        }),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(timelineData.length, (index) {
          final data = timelineData[index];
          return Container(
            width: 280,
            margin: EdgeInsets.only(right: index < timelineData.length - 1 ? s.spaceBtwItems : 0),
            child: YearCard(year: data['year'] as int, description: data['description'] as String, index: index),
          );
        }),
      ),
    );
  }

  // TIMELINE GRID FOR DESKTOP (CORRECTED)
  Widget _buildTimelineGrid(BuildContext context) {
    final timelineData = [
      {'year': 2022, 'description': 'Started Flutter Development Journey with First Production App'},
      {'year': 2023, 'description': 'Built 20+ Cross-Platform Apps for Startups & Enterprises'},
      {'year': 2024, 'description': 'Achieved Senior Developer Status with Advanced Architecture Skills'},
      {'year': 2025, 'description': 'Leading Enterprise Projects & Mentoring Junior Developers'},
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(timelineData.length, (index) {
        final data = timelineData[index];
        return YearCard(year: data['year'] as int, description: data['description'] as String, index: index);
      }),
    );
  }
}
