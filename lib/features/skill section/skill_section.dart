import 'package:flutter/material.dart';
import 'package:responsive_website/utility/constants/colors.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';
import 'package:responsive_website/utility/default_sizes/font_size.dart';
import 'package:responsive_website/utility/responsive/responsive_helper.dart';
import 'package:responsive_website/utility/responsive/responsive_widget.dart';
import 'package:responsive_website/utility/responsive/section_container.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;

    return SectionContainer(
      backgroundColor: DColors.background,
      padding: EdgeInsets.symmetric(vertical: s.spaceBtwSections * 2),
      child: Column(
        children: [
          // Section Title
          Padding(
            padding: EdgeInsets.symmetric(horizontal: s.paddingMd),
            child: Text(
              "Technical Skills & Expertise",
              style: fonts.displayLarge.rajdhani(
                fontSize: context.responsiveValue(mobile: 32, tablet: 40, desktop: 48),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: s.paddingSm),

          // Subtitle
          Padding(
            padding: EdgeInsets.symmetric(horizontal: s.paddingMd),
            child: Text(
              "Building scalable, efficient, and innovative applications",
              style: fonts.bodyLarge.rubik(color: DColors.textSecondary, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: s.spaceBtwSections * 2),

          // Skills Layout
          ResponsiveWidget(mobile: _buildMobileLayout(context), desktop: _buildDesktopLayout(context)),
        ],
      ),
    );
  }

  // 📱 Mobile Layout - Fixed overflow issues
  Widget _buildMobileLayout(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: context.sizes.paddingMd),
      child: Column(
        children: [
          _buildLanguageSection(context),
          SizedBox(height: context.sizes.spaceBtwSections),
          _buildFrameworkSection(context),
          SizedBox(height: context.sizes.spaceBtwSections),
          _buildDatabaseSection(context),
          SizedBox(height: context.sizes.spaceBtwSections),
          _buildAdvanceSkillsSection(context),
          SizedBox(height: context.sizes.spaceBtwSections),
          _buildVersionControlSection(context),
          SizedBox(height: context.sizes.spaceBtwSections),
          _buildTestingSection(context),
        ],
      ),
    );
  }

  // 💻 Desktop Layout
  Widget _buildDesktopLayout(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.sizes.paddingLg),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Column
          Expanded(
            child: Column(
              children: [
                _buildLanguageSection(context),
                SizedBox(height: context.sizes.spaceBtwSections),
                _buildFrameworkSection(context),
                SizedBox(height: context.sizes.spaceBtwSections),
                _buildDatabaseSection(context),
              ],
            ),
          ),
          SizedBox(width: context.sizes.spaceBtwSections),

          // Right Column
          Expanded(
            child: Column(
              children: [
                _buildAdvanceSkillsSection(context),
                SizedBox(height: context.sizes.spaceBtwSections),
                _buildVersionControlSection(context),
                SizedBox(height: context.sizes.spaceBtwSections),
                _buildTestingSection(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ══════════════════════════════════════════════════════════════════════
  // 📋 SKILL SECTIONS
  // ══════════════════════════════════════════════════════════════════════

  _SkillCard _buildLanguageSection(BuildContext context) {
    return _SkillCard(
      title: "Language",
      skills: [
        _SkillItem(name: "Dart", level: 0.95, isProficient: true),
        _SkillItem(name: "Kotlin", level: 0.85, isProficient: true),
        _SkillItem(name: "Java", level: 0.80, isProficient: true),
        _SkillItem(name: "Swift", level: 0.75, isProficient: true),
        _SkillItem(name: "C++", level: 0.70, isProficient: false),
        _SkillItem(name: "Python", level: 0.65, isProficient: false),
        _SkillItem(name: "JavaScript", level: 0.75, isProficient: false),
        _SkillItem(name: "HTML & CSS", level: 0.85, isProficient: false),
      ],
    );
  }

  Widget _buildFrameworkSection(BuildContext context) {
    return _SkillCard(
      title: "Framework & Libraries",
      skills: [
        _SkillItem(name: "RESTful Services", level: 0.90, isProficient: false),
        _SkillItem(name: "WebSocket Communication", level: 0.85, isProficient: false),
        _SkillItem(name: "Flutter Flavors", level: 0.90, isProficient: false),
        _SkillItem(name: "Push Notifications", level: 0.88, isProficient: false),
        _SkillItem(name: "Location Services", level: 0.85, isProficient: false),
        _SkillItem(name: "Provider", level: 0.92, isProficient: false),
        _SkillItem(name: "GetX", level: 0.88, isProficient: false),
        _SkillItem(name: "Bloc", level: 0.85, isProficient: false),
        _SkillItem(name: "Stripe Payment", level: 0.80, isProficient: false),
      ],
    );
  }

  Widget _buildDatabaseSection(BuildContext context) {
    return _SkillCard(
      title: "Databases & Persistence",
      skills: [
        _SkillItem(name: "SQLite", level: 0.90, isProficient: false),
        _SkillItem(name: "SharedPreferences", level: 0.95, isProficient: false),
        _SkillItem(name: "Hive", level: 0.88, isProficient: false),
        _SkillItem(name: "Firebase", level: 0.92, isProficient: false),
        _SkillItem(name: "SQL", level: 0.85, isProficient: false),
        _SkillItem(name: "MongoDB", level: 0.75, isProficient: false),
      ],
    );
  }

  Widget _buildAdvanceSkillsSection(BuildContext context) {
    return _SkillCard(
      title: "Advance Skills",
      skills: [
        _SkillItem(name: "Multi-threading (isolate)", level: 0.85, isProficient: false),
        _SkillItem(name: "Native code integration (FFI)", level: 0.80, isProficient: false),
        _SkillItem(name: "Custom Animation", level: 0.90, isProficient: false),
        _SkillItem(name: "Custom Widget", level: 0.92, isProficient: false),
        _SkillItem(name: "Custom Painting", level: 0.88, isProficient: false),
      ],
    );
  }

  Widget _buildVersionControlSection(BuildContext context) {
    return _SkillCard(
      title: "Version Control",
      skills: [
        _SkillItem(name: "Git", level: 0.90, isProficient: false),
        _SkillItem(name: "GitHub", level: 0.92, isProficient: false),
        _SkillItem(name: "CI/CD with GitHub Action", level: 0.80, isProficient: false),
      ],
    );
  }

  Widget _buildTestingSection(BuildContext context) {
    return _SkillCard(
      title: "Testing",
      skills: [
        _SkillItem(name: "Unit Tests", level: 0.85, isProficient: false),
        _SkillItem(name: "Widget Tests", level: 0.82, isProficient: false),
        _SkillItem(name: "Integration Tests", level: 0.78, isProficient: false),
      ],
    );
  }
}

// ══════════════════════════════════════════════════════════════════════
// 🎴 SKILL CARD WIDGET - Fixed text overflow
// ══════════════════════════════════════════════════════════════════════

// ══════════════════════════════════════════════════════════════════════
// 🎴 SKILL CARD WIDGET - Fixed text overflow
// ══════════════════════════════════════════════════════════════════════

class _SkillCard extends StatelessWidget {
  final String title;
  final List<_SkillItem> skills;

  const _SkillCard({required this.title, required this.skills});

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(context.responsiveValue(mobile: 20, tablet: 24, desktop: 28)),
      decoration: BoxDecoration(
        color: DColors.cardBackground,
        borderRadius: BorderRadius.circular(s.borderRadiusLg),
        border: Border.all(color: DColors.cardBorder, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ✅ Fixed: Title with overflow handling
          Text(
            title,
            style: fonts.headlineMedium.rajdhani(fontWeight: FontWeight.w600, color: DColors.primaryButton),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: s.spaceBtwItems),

          // Skills List
          ...skills.map((skill) => _buildSkillBar(context, skill)),
        ],
      ),
    );
  }

  Widget _buildSkillBar(BuildContext context, _SkillItem skill) {
    final s = context.sizes;
    final fonts = context.fonts;

    return Padding(
      padding: EdgeInsets.only(bottom: s.spaceBtwItems),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ✅ Fixed: Skill Name with Badge - Better overflow handling
          Row(
            children: [
              // Skill name - Flexible to prevent overflow
              Flexible(
                child: Text(
                  skill.name,
                  style: fonts.bodyMedium.rubik(fontWeight: FontWeight.w500, color: DColors.textPrimary),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              // ✅ Fixed: Badge with proper spacing
              if (skill.isProficient) ...[
                SizedBox(width: s.paddingSm),
                Flexible(
                  flex: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.responsiveValue(
                        mobile: s.paddingXs,
                        tablet: s.paddingSm,
                        desktop: s.paddingSm,
                      ),
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: DColors.primaryButton.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: DColors.primaryButton, width: 1),
                    ),
                    child: Text(
                      "Proficient",
                      style: fonts.labelSmall.rubik(
                        color: DColors.primaryButton,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
          SizedBox(height: s.paddingSm),

          // ✅ Fixed: Progress Bar with proper constraints
          LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  // Background
                  Container(
                    height: context.responsiveValue(mobile: 6.0, tablet: 7.0, desktop: 8.0),
                    width: constraints.maxWidth,
                    decoration: BoxDecoration(
                      color: DColors.cardBorder,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),

                  // Progress
                  Container(
                    height: context.responsiveValue(mobile: 6.0, tablet: 7.0, desktop: 8.0),
                    width: constraints.maxWidth * skill.level,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [DColors.primaryButton, DColors.primaryButton.withOpacity(0.7)],
                      ),
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(
                          color: DColors.primaryButton.withOpacity(0.3),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════════
// 📦 SKILL ITEM MODEL
// ══════════════════════════════════════════════════════════════════════

class _SkillItem {
  final String name;
  final double level; // 0.0 to 1.0
  final bool isProficient; // Show "Proficient" badge

  _SkillItem({required this.name, required this.level, this.isProficient = false});
}
