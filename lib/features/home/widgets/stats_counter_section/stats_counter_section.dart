import 'package:flutter/material.dart';
import 'widgets/animated_counter_card.dart';
import '../../../../utility/constants/colors.dart';
import '../../../../data_layer/model/stat_model.dart';
import '../../../../utility/default_sizes/font_size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utility/default_sizes/default_sizes.dart';
import '../../../../utility/responsive/responsive_helper.dart';
import '../../../../utility/responsive/responsive_widget.dart';
import '../../../../utility/responsive/section_container.dart';

class StatsCounterSection extends StatefulWidget {
  const StatsCounterSection({super.key});

  @override
  State<StatsCounterSection> createState() => _StatsCounterSectionState();
}

class _StatsCounterSectionState extends State<StatsCounterSection> {
  bool _startAnimation = false;

  @override
  void initState() {
    super.initState();
    // Start animation after a short delay
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          _startAnimation = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;

    return SectionContainer(
      backgroundColor: DColors.secondaryBackground,
      padding: EdgeInsets.symmetric(horizontal: s.paddingMd, vertical: s.spaceBtwSections * 1.5),
      child: ResponsiveWidget(
        mobile: _buildMobileLayout(context),
        tablet: _buildTabletLayout(context),
        desktop: _buildDesktopLayout(context),
      ),
    );
  }

  // 📱 Mobile Layout - Vertical Stack
  Widget _buildMobileLayout(BuildContext context) {
    final s = context.sizes;
    final stats = _getStatsData();

    return Column(
      children: [
        // Optional Section Title
        _buildSectionTitle(context),
        SizedBox(height: s.spaceBtwSections),

        // Stats Cards
        ...stats.map((stat) {
          return Padding(
            padding: EdgeInsets.only(bottom: s.spaceBtwItems),
            child: AnimatedCounterCard(
              stat: stat,
              startAnimation: _startAnimation,
              animationDuration: const Duration(milliseconds: 2000),
            ),
          );
        }),
      ],
    );
  }

  // 📱 Tablet Layout - 2x2 Grid
  Widget _buildTabletLayout(BuildContext context) {
    final s = context.sizes;
    final stats = _getStatsData();

    return Column(
      children: [
        // Optional Section Title
        _buildSectionTitle(context),
        SizedBox(height: s.spaceBtwSections),

        // Stats Grid
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: s.spaceBtwItems,
            mainAxisSpacing: s.spaceBtwItems,
            childAspectRatio: 1.3,
          ),
          itemCount: stats.length,
          itemBuilder: (context, index) {
            return AnimatedCounterCard(
              stat: stats[index],
              startAnimation: _startAnimation,
              animationDuration: Duration(milliseconds: 2000 + (index * 200)),
            );
          },
        ),
      ],
    );
  }

  // 💻 Desktop Layout - Horizontal Row
  Widget _buildDesktopLayout(BuildContext context) {
    final s = context.sizes;
    final stats = _getStatsData();

    return Column(
      children: [
        // Optional Section Title
        _buildSectionTitle(context),
        SizedBox(height: s.spaceBtwSections),

        // Stats Row
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(stats.length, (index) {
            return Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: s.paddingSm),
                child: AnimatedCounterCard(
                  stat: stats[index],
                  startAnimation: _startAnimation,
                  animationDuration: Duration(milliseconds: 2000 + (index * 200)),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  // 🎯 Section Title (Optional - can be removed if not needed)
  Widget _buildSectionTitle(BuildContext context) {
    final fonts = context.fonts;

    return Column(
      children: [
        Text(
          'Achievements',
          style: fonts.displayMedium,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: context.sizes.paddingSm),
        SizedBox(
          width: context.responsiveValue(mobile: double.infinity, tablet: 500.w, desktop: 600.w),
          child: Text(
            'Numbers that speak for themselves',
            style: fonts.bodyLarge.rubik(color: DColors.textSecondary, height: 1.6),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  // 📊 Stats Data
  List<StatModel> _getStatsData() {
    return [
      StatModel(label: 'Projects Delivered', value: 50, suffix: '+', icon: 'projects'),
      StatModel(label: 'Happy Clients', value: 30, suffix: '+', icon: 'clients'),
      StatModel(label: 'Platforms Mastered', value: 4, suffix: '', icon: 'platforms'),
      StatModel(label: 'Client Satisfaction', value: 98, suffix: '%', icon: 'satisfaction'),
    ];
  }
}
