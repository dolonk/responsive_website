import 'package:flutter/material.dart';
import 'package:responsive_website/common_function/base_screen/base_screen.dart';
import 'package:responsive_website/features/home/widgets/latest_projects/latest_projects.dart';
import 'package:responsive_website/utility/constants/colors.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';
import 'package:responsive_website/utility/default_sizes/font_size.dart';
import 'package:responsive_website/utility/responsive/responsive_helper.dart';
import 'package:responsive_website/utility/responsive/section_container.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: DColors.secondaryBackground,
      child: Column(children: [_buildHeroSection(context), const LatestProjectsSection()]),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;

    return SectionContainer(
      backgroundColor: DColors.background,
      padding: EdgeInsets.symmetric(horizontal: s.paddingLg, vertical: s.spaceBtwSections * 2),
      child: Column(
        children: [
          Text(
            'Our Projects',
            style: fonts.displayLarge.rajdhani(
              fontSize: context.responsiveValue(mobile: 40, tablet: 56, desktop: 64),
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: s.paddingMd),

          SizedBox(
            width: context.responsiveValue(mobile: double.infinity, tablet: 600, desktop: 700),
            child: Text(
              'Explore our portfolio of successful projects across various platforms and industries',
              style: fonts.bodyLarge.rubik(color: DColors.textSecondary, height: 1.6),
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
