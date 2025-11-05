import 'package:flutter/material.dart';
import 'widgets/solution/solution_section.dart';
import 'widgets/challenge/challenge_section.dart';
import 'widgets/hero/project_hero_section.dart';
import '../../data_layer/model/project_model.dart';
import 'widgets/overview/widgets/project_overview_section.dart';
import 'package:responsive_website/utility/constants/colors.dart';
import 'package:responsive_website/common_function/base_screen/base_screen.dart';
import 'package:responsive_website/features/project_detail/widgets/tech_stack/tech_stack_section.dart';

class ProjectDetailPage extends StatelessWidget {
  final String projectId;

  const ProjectDetailPage({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    final project = ProjectModel.getSampleProject(projectId);

    return BaseScreen(
      backgroundColor: DColors.secondaryBackground,
      child: Column(
        children: [
          // Hero Image
          ProjectHeroSection(project: project),

          // Project Overview
          ProjectOverviewSection(project: project),

          // The Challenge
          ChallengeSection(project: project),

          // The Solution
          SolutionSection(project: project),

          // ✅ Section 5: Tech Stack Used
          TechStackSection(project: project),
          // 🔜 Section 6: Key Features
          // 🔜 Section 7: Results & Impact
          // 🔜 Section 8: Image Gallery
          // 🔜 Section 9: Demo & Links
          // 🔜 Section 10: Related Projects
          // 🔜 Section 11: CTA Section

          // Temporary placeholder
          Container(
            height: 500,
            color: DColors.secondaryBackground,
            child: Center(
              child: Text(
                'Project: ${project.title}\n\nRemaining sections will be added next',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
