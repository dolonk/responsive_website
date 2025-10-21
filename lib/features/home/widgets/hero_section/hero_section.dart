import 'package:flutter/material.dart';
import 'package:responsive_website/utility/constants/colors.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';
import 'package:responsive_website/utility/responsive/responsive_helper.dart';
import 'package:responsive_website/utility/responsive/responsive_widget.dart';
import 'package:responsive_website/utility/responsive/section_container.dart';
import 'package:responsive_website/features/home/widgets/hero_section/widgets/intro_content.dart';
import 'package:responsive_website/features/home/widgets/hero_section/widgets/hero_image.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      backgroundColor: DColors.background,
      padding: EdgeInsets.symmetric(horizontal: context.isMobile ? 0 : context.sizes.paddingLg),
      child: ResponsiveWidget(
        mobile: _buildMobileLayout(context),
        tablet: _buildTabletLayout(context),
        desktop: _buildDesktopLayout(context),
      ),
    );
  }

  // 📱 Mobile Layout
  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        HeroImage(),
        SizedBox(height: context.sizes.spaceBtwItems),
        IntroContent(),
        SizedBox(height: context.sizes.spaceBtwItems),
      ],
    );
  }

  // 📱 Tablet Layout
  Widget _buildTabletLayout(BuildContext context) {
    return Column(
      children: [
        HeroImage(),
        SizedBox(height: context.sizes.spaceBtwItems),
        IntroContent(),
        SizedBox(height: context.sizes.spaceBtwItems),
      ],
    );
  }

  // 💻 Desktop Layout
  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 3, child: IntroContent()),
        Expanded(flex: 2, child: HeroImage()),
      ],
    );
  }
}
