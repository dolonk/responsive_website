import 'package:flutter/material.dart';
import '../../../../data_layer/model/project_model.dart';
import 'package:responsive_website/utility/constants/colors.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';
import 'package:responsive_website/utility/default_sizes/font_size.dart';
import 'package:responsive_website/utility/responsive/responsive_helper.dart';
import 'package:responsive_website/utility/responsive/section_container.dart';
import 'package:responsive_website/features/home/widgets/latest_projects/widgets/filter_chip.dart';
import 'package:responsive_website/features/home/widgets/latest_projects/widgets/project_card.dart';

class LatestProjectsSection extends StatefulWidget {
  const LatestProjectsSection({super.key});

  @override
  State<LatestProjectsSection> createState() => _LatestProjectsSectionState();
}

class _LatestProjectsSectionState extends State<LatestProjectsSection> {
  String _selectedFilter = 'All';

  final List<String> _filters = ['All', 'Android App', 'Ios App', 'Web Development', 'Desktop', 'Mac Os'];

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;

    return SectionContainer(
      padding: EdgeInsets.all(context.sizes.paddingMd),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Subtitle
          Text('Latest Portfolios', style: fonts.bodyLarge.rubik(color: DColors.primaryButton)),
          SizedBox(height: s.paddingSm),

          // Title
          Text('Elevating Visions into Masterpieces', style: fonts.displayLarge, textAlign: TextAlign.center),
          SizedBox(height: s.paddingSm),

          // Filter Chips
          _buildFilterChips(context),
          SizedBox(height: s.spaceBtwSections),

          // Projects Grid
          _buildProjectsGrid(context),
        ],
      ),
    );
  }

  // 🎯 FILTER CHIPS - Fixed Responsive
  Widget _buildFilterChips(BuildContext context) {
    final s = context.sizes;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: s.paddingMd),
      child: Wrap(
        spacing: context.responsiveValue(
          mobile: s.spaceBtwItems * 0.5,
          tablet: s.spaceBtwItems * 0.75,
          desktop: s.spaceBtwItems,
        ),
        runSpacing: context.responsiveValue(
          mobile: s.spaceBtwItems * 0.5,
          tablet: s.spaceBtwItems * 0.75,
          desktop: s.spaceBtwItems,
        ),
        alignment: WrapAlignment.center,
        children: _filters.map((filter) {
          final isActive = _selectedFilter == filter;
          return DFilterChip(
            label: filter,
            isActive: isActive,
            onTap: () {
              setState(() {
                _selectedFilter = filter;
              });
            },
          );
        }).toList(),
      ),
    );
  }

  // 📋 GET FILTERED PROJECTS
  List<ProjectModel> _getFilteredProjects() {
    final allProjects = _getAllProjects();
    if (_selectedFilter == 'All') return allProjects;
    return allProjects.where((project) => project.category == _selectedFilter).toList();
  }

  // 📱 PROJECTS GRID - Fixed Responsive with proper aspect ratios
  Widget _buildProjectsGrid(BuildContext context) {
    final s = context.sizes;
    final projects = _getFilteredProjects();

    // ✅ Fixed: Proper cross axis count for all devices
    final crossAxisCount = context.responsiveValue(mobile: 1, tablet: 2, desktop: 3);

    // ✅ Fixed: Proper aspect ratio for all devices
    final aspectRatio = context.responsiveValue(mobile: 0.75, tablet: 0.82, desktop: 0.88);

    // ✅ Fixed: Proper spacing for all devices
    final gridSpacing = context.responsiveValue(
      mobile: s.spaceBtwItems,
      tablet: s.spaceBtwSections * 0.75,
      desktop: s.spaceBtwSections,
    );

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.responsiveValue(mobile: s.paddingSm, tablet: s.paddingMd, desktop: s.paddingLg),
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: projects.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: gridSpacing,
          mainAxisSpacing: gridSpacing,
          childAspectRatio: aspectRatio,
        ),
        itemBuilder: (context, index) => ProjectCard(project: projects[index]),
      ),
    );
  }

  // 📦 PROJECT DATA
  List<ProjectModel> _getAllProjects() {
    return [
      ProjectModel(
        title: "Fashion Portfolio Website",
        category: "Web Development",
        description:
            "A sleek and modern portfolio website tailored for a fashion model showcasing creativity.",
        imagePath: "assets/home/projects/project_1.png",
      ),
      ProjectModel(
        title: "E-Commerce Mobile App",
        category: "Android App",
        description:
            "Full-featured shopping app with payment integration and real-time tracking capabilities.",
        imagePath: "assets/home/projects/project_2.png",
      ),
      ProjectModel(
        title: "Restaurant Booking System",
        category: "Web Development",
        description: "Modern restaurant booking platform with table management and customer reviews system.",
        imagePath: "assets/home/projects/project_3.png",
      ),
      ProjectModel(
        title: "Fitness Tracking App",
        category: "Ios App",
        description: "Health and fitness app with workout plans, calorie tracking, and progress analytics.",
        imagePath: "assets/home/projects/project_4.png",
      ),
      ProjectModel(
        title: "Brand Identity Design",
        category: "Desktop",
        description:
            "Complete brand identity package including logo, color palette, and marketing materials.",
        imagePath: "assets/home/projects/project_5.png",
      ),
      ProjectModel(
        title: "Travel Vlog Edit",
        category: "Mac Os",
        description: "Cinematic travel video with smooth transitions, color grading, and motion graphics.",
        imagePath: "assets/home/projects/project_6.png",
      ),
    ];
  }
}
