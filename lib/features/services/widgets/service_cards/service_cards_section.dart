// lib/features/services/widgets/service_cards/service_cards_section.dart

import 'package:flutter/material.dart';
import 'package:responsive_website/common_function/style/section_header.dart';
import 'package:responsive_website/data_layer/model/service_detail_model.dart';
import 'package:responsive_website/utility/constants/colors.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';
import 'package:responsive_website/utility/responsive/responsive_helper.dart';
import 'package:responsive_website/utility/responsive/section_container.dart';
import 'widgets/service_card_detailed.dart';

/// 🎯 Section 2: Service Cards (Detailed)
/// PDF Section 2: 6 detailed service cards with pricing
class ServiceCardsSection extends StatelessWidget {
  const ServiceCardsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;
    final services = getAllServices();

    return SectionContainer(
      backgroundColor: DColors.secondaryBackground,
      padding: EdgeInsets.symmetric(horizontal: s.paddingMd, vertical: s.spaceBtwSections),
      child: Column(
        children: [
          // Section Header
          const SectionHeader(
            subtitle: 'Our Services',
            title: 'Comprehensive Development Solutions',
            description:
                'From concept to deployment, I provide end-to-end development services tailored to your business needs.',
          ),
          SizedBox(height: s.spaceBtwItems),

          // Service Cards Grid
          _buildServiceCardsGrid(context, services, s),
        ],
      ),
    );
  }

  /// Service Cards Grid Layout
  Widget _buildServiceCardsGrid(BuildContext context, List<ServiceDetailModel> services, DSizes s) {
    final crossAxisCount = context.responsiveValue(mobile: 1, tablet: 2, desktop: 3);
    final spacing = s.spaceBtwItems;

    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = (constraints.maxWidth - (spacing * (crossAxisCount - 1))) / crossAxisCount;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: services.map((service) {
            return SizedBox(
              width: context.isMobile ? double.infinity : cardWidth,
              child: ServiceCardDetailed(service: service),
            );
          }).toList(),
        );
      },
    );
  }

  static List<ServiceDetailModel> getAllServices() {
    return [
      // 1. Mobile App Development
      ServiceDetailModel(
        id: 'mobile-development',
        title: 'Mobile App Development',
        description:
            'Native iOS & Android apps with Material Design and Cupertino widgets, state management, and seamless API integration.',
        icon: Icons.phone_android_rounded,
        deliverables: [
          'Native iOS & Android apps',
          'Material Design + Cupertino widgets',
          'State management implementation',
          'API integration',
          'App store deployment',
        ],
        technologies: ['Flutter', 'Dart', 'Firebase', 'Provider', 'BLoC'],
        pricing: 'From \$3,500',
        buttonText: 'Get a Quote',
      ),

      // 2. Web Application Development
      ServiceDetailModel(
        id: 'web-development',
        title: 'Web Application Development',
        description:
            'Responsive web applications with PWA support, SEO optimization, and cross-browser compatibility for modern web experiences.',
        icon: Icons.web_rounded,
        deliverables: [
          'Responsive web apps',
          'PWA support',
          'SEO optimization',
          'Cross-browser compatibility',
          'Firebase/AWS hosting',
        ],
        technologies: ['Flutter Web', 'HTML5', 'CSS3', 'Firebase', 'AWS'],
        pricing: 'From \$4,000',
        buttonText: 'Get a Quote',
      ),

      // 3. Desktop Application Development
      ServiceDetailModel(
        id: 'desktop-development',
        title: 'Desktop Development',
        description:
            'Cross-platform desktop applications for Windows, macOS, and Linux with native platform integration and auto-update support.',
        icon: Icons.laptop_mac_rounded,
        deliverables: [
          'Windows, macOS, Linux apps',
          'Native platform integration',
          'File system access',
          'System tray functionality',
          'Auto-update support',
        ],
        technologies: ['Flutter Desktop', 'C++', 'SQLite', 'Platform Channels'],
        pricing: 'From \$5,000',
        buttonText: 'Get a Quote',
      ),

      // 4. UI/UX Design Services
      ServiceDetailModel(
        id: 'uiux-design',
        title: 'UI/UX Design Services',
        description:
            'User-centered design solutions from research to high-fidelity mockups, creating intuitive and beautiful user experiences.',
        icon: Icons.design_services_rounded,
        deliverables: [
          'User research & personas',
          'Wireframing & prototyping',
          'High-fidelity mockups',
          'Design system creation',
          'Usability testing',
        ],
        technologies: ['Figma', 'Adobe XD', 'Sketch', 'InVision'],
        pricing: 'From \$800',
        buttonText: 'Get a Quote',
      ),

      // 5. Consulting & Code Review
      ServiceDetailModel(
        id: 'consulting',
        title: 'Consulting & Code Review',
        description:
            'Expert guidance on architecture, performance optimization, and best practices to elevate your development process.',
        icon: Icons.psychology_rounded,
        deliverables: [
          'Architecture review',
          'Performance optimization',
          'Code refactoring guidance',
          'Team training',
          'Best practices implementation',
        ],
        technologies: ['Flutter', 'Dart', 'Clean Architecture', 'MVVM', 'Testing'],
        pricing: '\$100/hour',
        buttonText: 'Book a Session',
      ),

      // 6. Maintenance & Support
      ServiceDetailModel(
        id: 'maintenance',
        title: 'Maintenance & Support',
        description:
            'Ongoing support and maintenance to keep your applications running smoothly with bug fixes, updates, and monitoring.',
        icon: Icons.support_agent_rounded,
        deliverables: [
          'Bug fixes',
          'Feature updates',
          'OS compatibility updates',
          'Performance monitoring',
          '24/7 support options',
        ],
        technologies: ['CI/CD', 'Analytics', 'Firebase', 'Monitoring Tools'],
        pricing: '\$400 - \$1,500/month',
        buttonText: 'Discuss Plans',
      ),
    ];
  }
}
