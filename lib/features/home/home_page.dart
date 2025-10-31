import 'package:flutter/material.dart';
import 'package:responsive_website/utility/constants/colors.dart';
import 'widgets/process_timeline_section/process_timeline_section.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';
import 'package:responsive_website/common_function/base_screen/base_screen.dart';
import 'package:responsive_website/features/home/widgets/blog_section/blog_section.dart';
import 'package:responsive_website/features/home/widgets/get_in_touch/get_in_touch.dart';
import 'package:responsive_website/features/home/widgets/hero_section/hero_section.dart';
import 'package:responsive_website/features/home/widgets/latest_projects/latest_projects.dart';
import 'package:responsive_website/features/home/widgets/reviews_section/reviews_section.dart';
import 'package:responsive_website/features/home/widgets/service_section/services_section.dart';
import 'package:responsive_website/features/home/widgets/experience_section/experience_section.dart';
import 'package:responsive_website/features/home/widgets/tech_stack_section/tech_stack_section.dart';
import 'package:responsive_website/features/home/widgets/why_choose_me_section/why_choose_me_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: DColors.secondaryBackground,
      child: Column(
        children: [
          HeroSection(),
          MyServiceSection(),
          ExperienceSection(),
          SizedBox(height: context.sizes.paddingMd * 1.5),
          LatestProjectsSection(),
          SizedBox(height: context.sizes.spaceBtwSections),
          WhyChooseMeSection(),
          SizedBox(height: context.sizes.paddingMd),
          TechStackSection(),
          ProcessTimelineSection(),
          ReviewsSection(),
          BlogSection(),
          GetInTouchSection(),
        ],
      ),
    );
  }
}
