import 'package:flutter/material.dart';
import 'widgets/hero/project_hero_section.dart';
import '../../data_layer/model/project_model.dart';
import 'package:responsive_website/utility/constants/colors.dart';
import 'package:responsive_website/common_function/base_screen/base_screen.dart';

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
          // ✅ Section 1: Hero Image
          ProjectHeroSection(project: project),

          // 🔜 Section 2: Project Overview
          // 🔜 Section 3: The Challenge
          // 🔜 Section 4: The Solution
          // 🔜 Section 5: Tech Stack Used
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
