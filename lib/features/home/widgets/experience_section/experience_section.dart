import 'package:flutter/material.dart';
import 'package:responsive_website/utility/constants/colors.dart';
import 'package:responsive_website/utility/default_sizes/font_size.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';
import 'package:responsive_website/utility/responsive/responsive_widget.dart';
import 'package:responsive_website/utility/responsive/section_container.dart';
import 'package:responsive_website/features/home/widgets/experience_section/widgets/start_card.dart';
import 'package:responsive_website/features/home/widgets/experience_section/widgets/year_card.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;

    return SectionContainer(
      padding: EdgeInsets.symmetric(vertical: s.spaceBtwSections, horizontal: context.sizes.paddingLg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Section Title
          Text("My Experiences", style: fonts.displayLarge),
          SizedBox(height: s.spaceBtwSections),

          // Responsive Layout
          ResponsiveWidget(
            mobile: _buildMobileLayout(context),
            tablet: _buildTabletLayout(context),
            desktop: _buildDesktopLayout(context),
          ),
        ],
      ),
    );
  }

  // 📱 Mobile Layout
  Widget _buildMobileLayout(BuildContext context) {
    final s = context.sizes;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: s.paddingMd),
      child: Column(
        children: [
          YearsCard(),
          SizedBox(height: s.spaceBtwSections),
          StatCard(title: "10+", subtitle: "Mobile Apps Published"),
          SizedBox(height: s.spaceBtwItems),
          StatCard(title: "20+", subtitle: "Client Projects Delivered"),
          SizedBox(height: s.spaceBtwItems),
          StatCard(title: "Flutter Expert", subtitle: "Android • iOS • Web • macOS • Windows"),
          SizedBox(height: s.spaceBtwItems),
          StatCard(title: "UI/UX Focused", subtitle: "Pixel Perfect Design"),
        ],
      ),
    );
  }

  // 📱 Tablet Layout
  Widget _buildTabletLayout(BuildContext context) {
    final s = context.sizes;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: s.paddingMd),
      child: Column(
        children: [
          YearsCard(),
          SizedBox(height: s.spaceBtwSections),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: s.spaceBtwItems,
            crossAxisSpacing: s.spaceBtwItems,
            childAspectRatio: 1.6,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              StatCard(title: "10+", subtitle: "Mobile Apps Published"),
              StatCard(title: "20+", subtitle: "Client Projects Delivered"),
              StatCard(title: "Flutter Expert", subtitle: "Android • iOS • Web • macOS • Windows"),
              StatCard(title: "UI/UX Focused", subtitle: "Pixel Perfect Design"),
            ],
          ),
        ],
      ),
    );
  }

  // 💻 Desktop Layout
  Widget _buildDesktopLayout(BuildContext context) {
    final s = context.sizes;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Pink Gradient Circle (Background decoration)
        Positioned(
          left: 50,
          bottom: -100,
          child: Container(
            width: 320,
            height: 350,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFFF014F), Color(0xff000000)],
              ),
            ),
          ),
        ),

        // Main Content
        SizedBox(
          height: 312,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Years Card (Left side)
              Padding(
                padding: EdgeInsets.only(left: s.spaceBtwSections * 4),
                child: YearsCard(),
              ),

              // Stats Grid (Right side)
              Column(
                children: [
                  // First Row
                  Row(
                    children: [
                      StatCard(title: "10+", subtitle: "Mobile Apps Published"),
                      SizedBox(width: s.spaceBtwSections),
                      StatCard(title: "20+", subtitle: "Client Projects Delivered"),
                    ],
                  ),
                  SizedBox(height: s.paddingSm),

                  // Second Row
                  Row(
                    children: [
                      StatCard(title: "Flutter Expert", subtitle: "Android • iOS • Web • macOS • Windows"),
                      SizedBox(width: s.spaceBtwSections),
                      StatCard(title: "UI/UX Focused", subtitle: "Pixel Perfect Design"),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
