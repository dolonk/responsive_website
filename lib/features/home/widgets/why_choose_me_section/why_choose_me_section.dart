import 'widgets/benefit_card.dart';
import 'package:flutter/material.dart';
import '../../../../utility/constants/colors.dart';
import '../../../../data_layer/model/benefit_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utility/default_sizes/default_sizes.dart';
import '../../../../utility/default_sizes/font_size.dart';
import '../../../../utility/responsive/responsive_helper.dart';
import '../../../../utility/responsive/responsive_widget.dart';
import '../../../../utility/responsive/section_container.dart';

class WhyChooseMeSection extends StatelessWidget {
  const WhyChooseMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;

    return SectionContainer(
      backgroundColor: DColors.background,
      padding: EdgeInsets.symmetric(horizontal: s.paddingMd, vertical: s.spaceBtwSections * 1.5),
      child: ResponsiveWidget(
        mobile: _buildMobileLayout(context),
        tablet: _buildTabletLayout(context),
        desktop: _buildDesktopLayout(context),
      ),
    );
  }

  // 📱 Mobile Layout - Vertical Stack
  Widget _buildMobileLayout(BuildContext context) {
    final s = context.sizes;

    return Column(
      children: [
        // Professional Image
        _buildProfessionalImage(context),
        SizedBox(height: s.spaceBtwSections),

        // Section Header
        _buildSectionHeader(context),
        SizedBox(height: s.spaceBtwItems),

        // Benefits List
        _buildBenefitsList(context),
      ],
    );
  }

  // 📱 Tablet Layout - Similar to Mobile
  Widget _buildTabletLayout(BuildContext context) {
    final s = context.sizes;

    return Column(
      children: [
        // Professional Image
        _buildProfessionalImage(context),
        SizedBox(height: s.spaceBtwSections),

        // Section Header
        _buildSectionHeader(context),
        SizedBox(height: s.spaceBtwItems),

        // Benefits List
        _buildBenefitsList(context),
      ],
    );
  }

  // 💻 Desktop Layout - Side by Side
  Widget _buildDesktopLayout(BuildContext context) {
    final s = context.sizes;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Left: Professional Image
        Expanded(flex: 2, child: _buildProfessionalImage(context)),
        SizedBox(width: s.spaceBtwSections * 2),

        // Right: Content
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionHeader(context, align: TextAlign.start),
              SizedBox(height: s.spaceBtwSections),
              _buildBenefitsList(context),
            ],
          ),
        ),
      ],
    );
  }

  // 🖼️ Professional Image Section
  Widget _buildProfessionalImage(BuildContext context) {
    final s = context.sizes;

    return Stack(
      alignment: Alignment.center,
      children: [
        // Background Gradient Circle
        Container(
          width: context.responsiveValue(mobile: 280.w, tablet: 350.w, desktop: 450.w),
          height: context.responsiveValue(mobile: 280.h, tablet: 350.h, desktop: 450.h),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                DColors.primaryButton.withAlpha((255 * 0.2).round()),
                DColors.primaryButton.withAlpha((255 * 0.05).round()),
                Colors.transparent,
              ],
              stops: const [0.0, 0.6, 1.0],
            ),
          ),
        ),

        // Professional Image/Illustration
        Container(
          width: context.responsiveValue(mobile: 250.w, tablet: 320.w, desktop: 400.w),
          height: context.responsiveValue(mobile: 250.h, tablet: 320.h, desktop: 400.h),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: DColors.primaryButton.withAlpha((255 * 0.3).round()), width: 3),
            boxShadow: [
              BoxShadow(
                color: DColors.primaryButton.withAlpha((255 * 0.2).round()),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: ClipOval(
            child: Image.asset(
              'assets/home/hero_section/dk.png', // Replace with your image
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: DColors.cardBackground,
                  child: Icon(Icons.person_outline_rounded, size: 100.sp, color: DColors.textSecondary),
                );
              },
            ),
          ),
        ),

        // Floating Badge (Optional - "2.6+ Years")
        Positioned(
          bottom: context.responsiveValue(mobile: 20.h, desktop: 40.h),
          right: context.responsiveValue(mobile: 20.w, desktop: 40.w),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: DColors.primaryButton,
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: DColors.primaryButton.withAlpha((255 * 0.4).round()),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Text(
              '2.6+ Years',
              style: context.fonts.labelLarge.rubik(color: DColors.textPrimary, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  // 📝 Section Header
  Widget _buildSectionHeader(BuildContext context, {TextAlign? align}) {
    final s = context.sizes;
    final fonts = context.fonts;
    final isDesktop = context.isDesktop;

    return Column(
      crossAxisAlignment: isDesktop ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        // Subtitle
        Text(
          'Why Work With Me?',
          style: fonts.bodyLarge.rubik(color: DColors.primaryButton, fontWeight: FontWeight.w600),
          textAlign: align ?? (isDesktop ? TextAlign.start : TextAlign.center),
        ),
        SizedBox(height: s.paddingSm),

        // Main Title
        Text(
          'Building Excellence in Every Line of Code',
          style: fonts.displayMedium.rajdhani(fontWeight: FontWeight.bold),
          textAlign: align ?? (isDesktop ? TextAlign.start : TextAlign.center),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: s.spaceBtwItems),

        // Description
        SizedBox(
          width: isDesktop ? double.infinity : 600.w,
          child: Text(
            'I deliver high-quality, scalable Flutter applications with clean architecture and best practices. Your success is my priority.',
            style: fonts.bodyMedium.rubik(color: DColors.textSecondary, height: 1.6),
            textAlign: align ?? (isDesktop ? TextAlign.start : TextAlign.center),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  // 📋 Benefits List
  Widget _buildBenefitsList(BuildContext context) {
    final s = context.sizes;
    final benefits = _getBenefitsData();

    return Column(
      children: List.generate(
        benefits.length,
        (index) => Padding(
          padding: EdgeInsets.only(bottom: s.spaceBtwItems),
          child: BenefitCard(benefit: benefits[index], index: index),
        ),
      ),
    );
  }

  // 📊 Benefits Data
  List<BenefitModel> _getBenefitsData() {
    return [
      BenefitModel(
        title: 'Production-Ready Code',
        description:
            'Every project follows MVVM architecture, clean code principles, and industry best practices for long-term maintainability.',
        icon: Icons.code_rounded,
      ),
      BenefitModel(
        title: 'Cross-Platform Expertise',
        description:
            'Master of Flutter across iOS, Android, Web, Windows, macOS, and Linux - one codebase, all platforms.',
        icon: Icons.devices_rounded,
      ),
      BenefitModel(
        title: 'Clean Architecture & Testing',
        description:
            'Structured code with proper separation of concerns, dependency injection, and comprehensive unit/widget testing.',
        icon: Icons.architecture_rounded,
      ),
      BenefitModel(
        title: 'On-Time Delivery Guarantee',
        description:
            'Milestone-based development with transparent communication. 95% of projects delivered on or before deadline.',
        icon: Icons.schedule_rounded,
      ),
      BenefitModel(
        title: 'Post-Launch Support',
        description:
            'Every project includes support period. Bug fixes, updates, and guidance even after deployment.',
        icon: Icons.support_agent_rounded,
      ),
    ];
  }
}
