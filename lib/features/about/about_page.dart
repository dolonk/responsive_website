import 'package:flutter/material.dart';
import 'widgets/hero_section/about_hero_section.dart';
import 'package:responsive_website/common_function/base_screen/base_screen.dart';

import 'widgets/my_story/my_story_section.dart';
import 'widgets/skills/skills_section.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScreen(
      child: Column(
        children: [
          // Hero
          AboutHeroSection(),

          // My Story
          MyStorySection(),

          // Skills Showcase
          SkillsSection(),
        ],
      ),
    );
  }
}
