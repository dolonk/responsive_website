import 'package:flutter/material.dart';
import 'package:responsive_website/utility/constants/colors.dart';
import 'package:responsive_website/common_function/base_screen/base_screen.dart';
import 'widgets/hero_section/pricing_hero_section.dart';

class PricingPage extends StatelessWidget {
  const PricingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: DColors.background,
      child: Column(
        children: [
          // Section 1: Hero Section
          PricingHeroSectionD(),
          PricingHeroSection(isYearly: true, onBillingChanged: (bool p1) {}),

          // Section 2: Intro paragraph (coming next)
          // PricingIntroSection(),

          // Section 3: Pricing cards (coming next)
          // PricingCardsSection(),

          // More sections...
        ],
      ),
    );
  }
}
