import 'widgets/project_card.dart';
import 'package:flutter/material.dart';
import 'package:responsive_website/utility/constants/colors.dart';
import 'package:responsive_website/data_layer/model/project_model.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';
import 'package:responsive_website/utility/responsive/responsive_helper.dart';
import 'package:responsive_website/utility/responsive/section_container.dart';

class ProjectGridSection extends StatelessWidget {
  final String selectedFilter;

  const ProjectGridSection({super.key, required this.selectedFilter});

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;
    final allProjects = ProjectModel.getAllProjects();
    final filteredProjects = _getFilteredProjects(allProjects);

    return SectionContainer(
      backgroundColor: DColors.secondaryBackground,
      padding: EdgeInsets.symmetric(horizontal: s.paddingMd, vertical: s.spaceBtwSections),
      child: _buildProjectGrid(context, filteredProjects, s),
    );
  }

  /// Filter projects based on selected category
  List<ProjectModel> _getFilteredProjects(List<ProjectModel> projects) {
    if (selectedFilter == 'All') {
      return projects;
    }
    return projects.where((project) => project.category == selectedFilter).toList();
  }

  /// Project Grid Layout
  Widget _buildProjectGrid(BuildContext context, List<ProjectModel> projects, DSizes s) {
    final crossAxisCount = context.responsiveValue(mobile: 1, tablet: 2, desktop: 3);
    final spacing = s.spaceBtwItems;

    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = (constraints.maxWidth - (spacing * (crossAxisCount - 1))) / crossAxisCount;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: projects.map((project) {
            return SizedBox(
              width: context.isMobile ? double.infinity : cardWidth,
              child: ProjectCard(project: project),
            );
          }).toList(),
        );
      },
    );
  }
}
