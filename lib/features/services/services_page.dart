import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_website/common_function/base_screen/base_screen.dart';
import 'package:responsive_website/common_function/style/custom_button.dart';
import 'package:responsive_website/utility/constants/colors.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';
import 'package:responsive_website/utility/default_sizes/font_size.dart';
import 'package:responsive_website/utility/responsive/responsive_helper.dart';
import 'package:responsive_website/utility/responsive/responsive_widget.dart';
import 'package:responsive_website/utility/responsive/section_container.dart';

import '../../data_layer/model/service_detail_model.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
    _fadeAnimation = CurvedAnimation(parent: _animationController, curve: Curves.easeIn);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: DColors.secondaryBackground,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Column(
          children: [
            _buildHeroSection(context),
            _buildServicesGrid(context),
            _buildProcessSection(context),
            _buildTestimonialSection(context),
            _buildCTASection(context),
          ],
        ),
      ),
    );
  }

  /// 🎯 Hero Section
  Widget _buildHeroSection(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;

    return SectionContainer(
      backgroundColor: DColors.background,
      padding: EdgeInsets.symmetric(horizontal: s.paddingLg, vertical: s.spaceBtwSections * 2),
      child: Column(
        children: [
          // Title
          Text(
            'Services',
            style: fonts.displayLarge.rajdhani(
              fontSize: context.responsiveValue(mobile: 40, tablet: 56, desktop: 64),
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: s.paddingMd),

          // Subtitle
          SizedBox(
            width: context.responsiveValue(mobile: double.infinity, tablet: 600, desktop: 700),
            child: Text(
              'We provide a wide range of professional services to help bring your vision to life',
              style: fonts.bodyLarge.rubik(color: DColors.textSecondary, height: 1.6),
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: s.spaceBtwSections),

          // Stats Row
          _buildStatsRow(context),
        ],
      ),
    );
  }

  /// 📊 Stats Row
  Widget _buildStatsRow(BuildContext context) {
    final s = context.sizes;

    final stats = [
      {'label': 'Projects Completed', 'value': '50+'},
      {'label': 'Happy Clients', 'value': '30+'},
      {'label': 'Years Experience', 'value': '3+'},
    ];

    return ResponsiveWidget(
      mobile: Column(
        children: stats
            .map(
              (stat) => Padding(
                padding: EdgeInsets.only(bottom: s.spaceBtwItems),
                child: _StatCard(label: stat['label']!, value: stat['value']!),
              ),
            )
            .toList(),
      ),
      desktop: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: stats
            .map(
              (stat) => Padding(
                padding: EdgeInsets.symmetric(horizontal: s.paddingLg),
                child: _StatCard(label: stat['label']!, value: stat['value']!),
              ),
            )
            .toList(),
      ),
    );
  }

  /// 🎴 Services Grid
  Widget _buildServicesGrid(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;
    final services = _getServicesData();

    return SectionContainer(
      padding: EdgeInsets.symmetric(horizontal: s.paddingMd, vertical: s.spaceBtwSections),
      child: Column(
        children: [
          // Section Title
          Text('How can we help you?', style: fonts.headlineLarge, textAlign: TextAlign.center),
          SizedBox(height: s.paddingSm),

          SizedBox(
            width: 500,
            child: Text(
              'We offer comprehensive solutions tailored to your needs',
              style: fonts.bodyMedium.rubik(color: DColors.textSecondary),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: s.spaceBtwSections),

          // Services Grid
          ResponsiveWidget(
            mobile: _buildMobileServicesList(context, services),
            tablet: _buildTabletServicesGrid(context, services),
            desktop: _buildDesktopServicesGrid(context, services),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileServicesList(BuildContext context, List<ServiceDetailModel> services) {
    final s = context.sizes;
    return Column(
      children: services
          .map(
            (service) => Padding(
              padding: EdgeInsets.only(bottom: s.spaceBtwItems),
              child: _ServiceDetailCard(service: service),
            ),
          )
          .toList(),
    );
  }

  Widget _buildTabletServicesGrid(BuildContext context, List<ServiceDetailModel> services) {
    final s = context.sizes;
    return Wrap(
      spacing: s.spaceBtwItems,
      runSpacing: s.spaceBtwItems,
      children: services
          .map(
            (service) => SizedBox(
              width: (context.screenWidth - s.paddingMd * 2 - s.spaceBtwItems) / 2,
              child: _ServiceDetailCard(service: service),
            ),
          )
          .toList(),
    );
  }

  Widget _buildDesktopServicesGrid(BuildContext context, List<ServiceDetailModel> services) {
    final s = context.sizes;
    return Wrap(
      spacing: s.spaceBtwSections,
      runSpacing: s.spaceBtwSections,
      alignment: WrapAlignment.center,
      children: services
          .map(
            (service) => SizedBox(
              width: (context.screenWidth - s.paddingLg * 2 - s.spaceBtwSections * 2) / 3,
              child: _ServiceDetailCard(service: service),
            ),
          )
          .toList(),
    );
  }

  /// 🔄 Process Section
  Widget _buildProcessSection(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;

    return SectionContainer(
      backgroundColor: DColors.background,
      padding: EdgeInsets.symmetric(horizontal: s.paddingMd, vertical: s.spaceBtwSections),
      child: Column(
        children: [
          Text('Our Process', style: fonts.displayMedium, textAlign: TextAlign.center),
          SizedBox(height: s.paddingSm),

          SizedBox(
            width: 600,
            child: Text(
              'We follow a structured approach to deliver exceptional results',
              style: fonts.bodyMedium.rubik(color: DColors.textSecondary),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: s.spaceBtwSections),

          ResponsiveWidget(mobile: _buildProcessStepsMobile(context), desktop: _buildProcessStepsDesktop(context)),
        ],
      ),
    );
  }

  Widget _buildProcessStepsMobile(BuildContext context) {
    final s = context.sizes;
    final steps = _getProcessSteps();

    return Column(
      children: List.generate(steps.length, (index) {
        return Padding(
          padding: EdgeInsets.only(bottom: s.spaceBtwItems),
          child: _ProcessStepCard(step: steps[index], stepNumber: index + 1),
        );
      }),
    );
  }

  Widget _buildProcessStepsDesktop(BuildContext context) {
    final s = context.sizes;
    final steps = _getProcessSteps();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(steps.length, (index) {
        return Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: s.paddingSm),
            child: _ProcessStepCard(step: steps[index], stepNumber: index + 1),
          ),
        );
      }),
    );
  }

  /// 💬 Testimonial Section
  Widget _buildTestimonialSection(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;

    return SectionContainer(
      padding: EdgeInsets.symmetric(horizontal: s.paddingLg, vertical: s.spaceBtwSections),
      child: Column(
        children: [
          Text('Our Customers', style: fonts.displayMedium, textAlign: TextAlign.center),
          SizedBox(height: s.paddingSm),

          SizedBox(
            width: 600,
            child: Text(
              'See what our clients say about working with us',
              style: fonts.bodyMedium.rubik(color: DColors.textSecondary),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: s.spaceBtwSections),

          _buildTestimonialCard(context),
        ],
      ),
    );
  }

  Widget _buildTestimonialCard(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;

    return Container(
      constraints: const BoxConstraints(maxWidth: 800),
      padding: EdgeInsets.all(context.responsiveValue(mobile: s.paddingMd, desktop: s.paddingXl)),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1a1a1a), Color(0xFF0a0a0a)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(s.borderRadiusLg),
        border: Border.all(color: DColors.cardBorder, width: 1.5),
      ),
      child: Column(
        children: [
          // Quote Icon
          Icon(Icons.format_quote, size: 48, color: DColors.primaryButton.withOpacity(0.3)),
          SizedBox(height: s.spaceBtwItems),

          // Testimonial Text
          Text(
            '"Amazing Designs and Quality Work! The team delivered beyond our expectations. Their attention to detail and commitment to excellence is unmatched."',
            style: fonts.bodyLarge.rubik(color: DColors.textPrimary, height: 1.8, fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: s.spaceBtwSections),

          // Author
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/home/icon/sul.png'),
                backgroundColor: DColors.cardBorder,
              ),
              SizedBox(width: s.spaceBtwItems),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('John Doe', style: fonts.titleMedium),
                  Text('CEO, Acme Inc.', style: fonts.bodySmall.rubik(color: DColors.textSecondary)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// 🎯 CTA Section
  Widget _buildCTASection(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;

    return SectionContainer(
      backgroundColor: DColors.background,
      padding: EdgeInsets.symmetric(horizontal: s.paddingLg, vertical: s.spaceBtwSections * 1.5),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 900),
        padding: EdgeInsets.all(context.responsiveValue(mobile: s.paddingLg, desktop: s.paddingXl * 1.5)),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [DColors.primaryButton.withOpacity(0.2), DColors.primaryButton.withOpacity(0.05)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(s.borderRadiusLg),
          border: Border.all(color: DColors.primaryButton.withOpacity(0.3), width: 2),
        ),
        child: Column(
          children: [
            Text(
              'Would you like to start a project with us?',
              style: fonts.displaySmall.rajdhani(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: s.paddingMd),

            SizedBox(
              width: 600,
              child: Text(
                'Let\'s work together to bring your ideas to life. Get in touch with us today and let\'s create something amazing!',
                style: fonts.bodyMedium.rubik(color: DColors.textSecondary, height: 1.6),
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: s.spaceBtwSections),

            CustomButton(
              width: context.isMobile ? double.infinity : 200,
              height: 50,
              tittleText: 'Get Started',
              onPressed: () => context.go('/contact'),
            ),
          ],
        ),
      ),
    );
  }

  /// 📊 Get Services Data
  List<ServiceDetailModel> _getServicesData() {
    return [
      ServiceDetailModel(
        id: 'support',
        title: 'Help & Support',
        subtitle: '24/7 Available',
        description: 'Comprehensive support and maintenance services to keep your applications running smoothly.',
        iconPath: 'assets/home/icon/web_icon.svg',
        features: ['Bug Fixes', 'Performance Optimization', 'Feature Updates', 'Technical Support'],
        technologies: ['Monitoring Tools', 'Analytics', 'CI/CD'],
        deliveryTime: 'Ongoing',
        projectsCompleted: 30,
        rating: 5.0,
        process: [],
      ),
    ];
  }

  /// 🔄 Get Process Steps
  List<ServiceProcess> _getProcessSteps() {
    return [
      ServiceProcess(
        title: 'Discovery',
        description: 'We understand your requirements, goals, and target audience',
        icon: 'search',
      ),
      ServiceProcess(
        title: 'Planning',
        description: 'Create detailed project roadmap and technical specifications',
        icon: 'planning',
      ),
      ServiceProcess(
        title: 'Design',
        description: 'Design beautiful UI/UX that matches your brand identity',
        icon: 'design',
      ),
      ServiceProcess(
        title: 'Development',
        description: 'Build robust, scalable, and high-performance solutions',
        icon: 'code',
      ),
      ServiceProcess(title: 'Testing', description: 'Rigorous testing to ensure quality and reliability', icon: 'test'),
      ServiceProcess(
        title: 'Launch',
        description: 'Deploy and provide ongoing support for your success',
        icon: 'rocket',
      ),
    ];
  }
}

// ═══════════════════════════════════════════════════════════════
// 🎴 WIDGET COMPONENTS
// ═══════════════════════════════════════════════════════════════

/// 📊 Stat Card Widget
class _StatCard extends StatelessWidget {
  final String label;
  final String value;

  const _StatCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final fonts = context.fonts;

    return Column(
      children: [
        Text(
          value,
          style: fonts.displayMedium.rajdhani(color: DColors.primaryButton, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: fonts.bodyMedium.rubik(color: DColors.textSecondary),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

/// 🎴 Service Detail Card
class _ServiceDetailCard extends StatefulWidget {
  final ServiceDetailModel service;

  const _ServiceDetailCard({required this.service});

  @override
  State<_ServiceDetailCard> createState() => _ServiceDetailCardState();
}

class _ServiceDetailCardState extends State<_ServiceDetailCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: EdgeInsets.all(context.responsiveValue(mobile: s.paddingMd, desktop: s.paddingLg)),
        decoration: BoxDecoration(
          color: DColors.cardBackground,
          borderRadius: BorderRadius.circular(s.borderRadiusLg),
          border: Border.all(color: _isHovered ? DColors.primaryButton : DColors.cardBorder, width: 2),
          boxShadow: _isHovered
              ? [BoxShadow(color: DColors.primaryButton.withOpacity(0.3), blurRadius: 20, offset: const Offset(0, 10))]
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon
            Container(
              padding: EdgeInsets.all(s.paddingMd),
              decoration: BoxDecoration(
                color: DColors.primaryButton.withOpacity(0.1),
                borderRadius: BorderRadius.circular(s.borderRadiusSm),
              ),
              child: SvgPicture.asset(
                widget.service.iconPath,
                width: context.responsiveValue(mobile: 40, desktop: 50),
                height: context.responsiveValue(mobile: 40, desktop: 50),
                colorFilter: ColorFilter.mode(
                  _isHovered ? DColors.primaryButton : DColors.textPrimary,
                  BlendMode.srcIn,
                ),
              ),
            ),
            SizedBox(height: s.spaceBtwItems),

            // Title
            Text(
              widget.service.title,
              style: fonts.titleLarge.rajdhani(fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: s.paddingXs),

            // Subtitle
            Text(
              widget.service.subtitle,
              style: fonts.bodyMedium.rubik(color: DColors.primaryButton),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: s.spaceBtwItems),

            // Description
            Text(
              widget.service.description,
              style: fonts.bodySmall.rubik(color: DColors.textSecondary, height: 1.6),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: s.spaceBtwItems),

            // Features
            Wrap(
              spacing: s.paddingSm,
              runSpacing: s.paddingSm,
              children: widget.service.features.take(3).map((feature) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: s.paddingSm, vertical: s.paddingXs),
                  decoration: BoxDecoration(
                    color: DColors.cardBorder.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(s.borderRadiusSm),
                    border: Border.all(color: DColors.cardBorder),
                  ),
                  child: Text(feature, style: fonts.labelSmall.rubik(color: DColors.textSecondary)),
                );
              }).toList(),
            ),
            SizedBox(height: s.spaceBtwItems),

            // Bottom Info
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.access_time, size: 16, color: DColors.textSecondary),
                    SizedBox(width: s.paddingXs),
                    Text(widget.service.deliveryTime, style: fonts.labelMedium.rubik(color: DColors.textSecondary)),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.star, size: 16, color: Colors.amber),
                    SizedBox(width: s.paddingXs),
                    Text(widget.service.rating.toString(), style: fonts.labelMedium.rubik(color: DColors.textPrimary)),
                  ],
                ),
              ],
            ),
            SizedBox(height: s.spaceBtwItems),

            // Learn More Button
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                height: 40,
                tittleText: 'Learn More',
                onPressed: () {
                  // TODO: Navigate to service detail page
                  debugPrint('Learn more: ${widget.service.title}');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 🔄 Process Step Card
class _ProcessStepCard extends StatefulWidget {
  final ServiceProcess step;
  final int stepNumber;

  const _ProcessStepCard({required this.step, required this.stepNumber});

  @override
  State<_ProcessStepCard> createState() => _ProcessStepCardState();
}

class _ProcessStepCardState extends State<_ProcessStepCard> {
  bool _isHovered = false;

  IconData _getIconForStep(String icon) {
    switch (icon) {
      case 'search':
        return Icons.search_rounded;
      case 'planning':
        return Icons.calendar_today_rounded;
      case 'design':
        return Icons.brush_rounded;
      case 'code':
        return Icons.code_rounded;
      case 'test':
        return Icons.bug_report_rounded;
      case 'rocket':
        return Icons.rocket_launch_rounded;
      default:
        return Icons.circle_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.all(s.paddingMd),
        decoration: BoxDecoration(
          color: _isHovered ? DColors.cardBackground : Colors.transparent,
          borderRadius: BorderRadius.circular(s.borderRadiusLg),
          border: Border.all(color: _isHovered ? DColors.primaryButton : DColors.cardBorder, width: 2),
        ),
        child: Column(
          children: [
            // Step Number Badge
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: _isHovered
                      ? [DColors.primaryButton, DColors.primaryButton.withOpacity(0.7)]
                      : [DColors.cardBorder, DColors.cardBorder.withOpacity(0.5)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
              ),
              child: Center(child: Icon(_getIconForStep(widget.step.icon), color: Colors.white, size: 30)),
            ),
            SizedBox(height: s.spaceBtwItems),

            // Title
            Text(
              widget.step.title,
              style: fonts.titleMedium.rajdhani(
                color: _isHovered ? DColors.primaryButton : DColors.textPrimary,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: s.paddingXs),

            // Description
            Text(
              widget.step.description,
              style: fonts.bodySmall.rubik(color: DColors.textSecondary, height: 1.5),
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

/// 📊 Get Complete Services Data
/// Returns list of all available services with full details
List<ServiceDetailModel> _getServicesData() {
  return [
    // 1. App Development
    ServiceDetailModel(
      id: 'app-development',
      title: 'App Development',
      subtitle: 'iOS & Android',
      description:
          'Custom mobile applications with beautiful UI, smooth performance, and seamless user experience across all devices.',
      iconPath: 'assets/home/icon/android_icon.svg',
      features: ['Native Performance', 'Cross-platform', 'Push Notifications', 'Offline Support'],
      technologies: ['Flutter', 'Dart', 'Firebase'],
      deliveryTime: '4-8 weeks',
      projectsCompleted: 20,
      rating: 4.9,
      process: [],
    ),

    // 2. Web Development
    ServiceDetailModel(
      id: 'web-development',
      title: 'Web Development',
      subtitle: 'Responsive & Modern',
      description: 'Fast, secure, and SEO-friendly websites built with modern frameworks and best practices.',
      iconPath: 'assets/home/icon/web_icon.svg',
      features: ['Responsive Design', 'SEO Optimized', 'Fast Loading', 'Analytics Integration'],
      technologies: ['Flutter Web', 'HTML/CSS', 'JavaScript'],
      deliveryTime: '3-6 weeks',
      projectsCompleted: 15,
      rating: 4.8,
      process: [],
    ),

    // 3. UI/UX Design
    ServiceDetailModel(
      id: 'ui-ux-design',
      title: 'UI/UX Design',
      subtitle: 'User-Centered',
      description: 'Beautiful and intuitive designs that put user experience first while maintaining brand identity.',
      iconPath: 'assets/home/icon/web_icon.svg',
      features: ['Wireframing', 'Prototyping', 'User Testing', 'Design Systems'],
      technologies: ['Figma', 'Adobe XD', 'Sketch'],
      deliveryTime: '2-4 weeks',
      projectsCompleted: 25,
      rating: 5.0,
      process: [],
    ),

    // 4. Desktop Development
    ServiceDetailModel(
      id: 'desktop-development',
      title: 'Desktop Development',
      subtitle: 'Cross-Platform',
      description: 'Powerful desktop applications for Windows, macOS, and Linux with native performance.',
      iconPath: 'assets/home/icon/web_icon.svg',
      features: ['Native Look', 'File System Access', 'System Integration', 'Auto Updates'],
      technologies: ['Flutter Desktop', 'C++', 'SQLite'],
      deliveryTime: '6-10 weeks',
      projectsCompleted: 8,
      rating: 4.7,
      process: [],
    ),

    // 5. eCommerce Solutions
    ServiceDetailModel(
      id: 'ecommerce',
      title: 'eCommerce Solutions',
      subtitle: 'Complete Store',
      description: 'Full-featured online stores with payment integration, inventory management, and analytics.',
      iconPath: 'assets/home/icon/web_icon.svg',
      features: ['Payment Gateway', 'Admin Panel', 'Order Tracking', 'Inventory Management'],
      technologies: ['Flutter', 'Stripe', 'Firebase'],
      deliveryTime: '8-12 weeks',
      projectsCompleted: 10,
      rating: 4.9,
      process: [],
    ),

    // 6. Help & Support
    ServiceDetailModel(
      id: 'support',
      title: 'Help & Support',
      subtitle: '24/7 Available',
      description: 'Comprehensive support and maintenance services to keep your applications running smoothly.',
      iconPath: 'assets/home/icon/web_icon.svg',
      features: ['Bug Fixes', 'Performance Optimization', 'Feature Updates', 'Technical Support'],
      technologies: ['Monitoring Tools', 'Analytics', 'CI/CD'],
      deliveryTime: 'Ongoing',
      projectsCompleted: 30,
      rating: 5.0,
      process: [],
    ),
  ];
}
