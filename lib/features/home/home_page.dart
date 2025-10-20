import 'package:flutter/material.dart';
import 'package:responsive_website/features/home/widgets/service_widget/services_section.dart';
import '../../common_function/style/custom_card.dart';
import '../../utility/responsive/responsive_widget.dart';
import '../../utility/responsive/section_container.dart';
import 'package:responsive_website/features/home/widgets/hero_section.dart';
import 'package:responsive_website/common_function/base_screen/base_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Column(
        children: [
          // Hero Section
          HeroSection(),
          MyServiceSection(),

          // Services Section
          SectionContainer(
            child: Column(
              children: [
                const Text('Our Services', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
                const SizedBox(height: 40),
                ResponsiveWidget(mobile: _buildServicesMobile(), desktop: _buildServicesDesktop()),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildServicesMobile() {
    return Column(
      children: [
        CustomCard(
          icon: Icons.design_services,
          title: 'Web Design',
          description: 'Beautiful and modern website designs',
          onTap: () {},
        ),
        const SizedBox(height: 20),
        CustomCard(
          icon: Icons.code,
          title: 'Development',
          description: 'Clean and efficient code',
          onTap: () {},
        ),
        const SizedBox(height: 20),
        CustomCard(
          icon: Icons.phone_android,
          title: 'Mobile Apps',
          description: 'Cross-platform mobile applications',
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildServicesDesktop() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: CustomCard(
            icon: Icons.design_services,
            title: 'Web Design',
            description: 'Beautiful and modern website designs',
            onTap: () {},
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: CustomCard(
            icon: Icons.code,
            title: 'Development',
            description: 'Clean and efficient code',
            onTap: () {},
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: CustomCard(
            icon: Icons.phone_android,
            title: 'Mobile Apps',
            description: 'Cross-platform mobile applications',
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
