import 'package:flutter/material.dart';
import 'widgets/contact_options/contact_options_section.dart';
import 'package:responsive_website/utility/constants/colors.dart';
import 'package:responsive_website/common_function/base_screen/base_screen.dart';
import 'package:responsive_website/features/contact/widgets/hero_section/contact_hero_section.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: DColors.background,
      child: Column(
        children: [
          // Hero Section
          const ContactHeroSection(),

          // Contact Options
          const ContactOptionsSection(),
        ],
      ),
    );
  }
}
