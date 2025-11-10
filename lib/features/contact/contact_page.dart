import 'package:flutter/material.dart';
import 'widgets/timeline/timeline_section.dart';
import 'widgets/calendar/calendar_section.dart';
import 'widgets/testimonials/testimonials_section.dart';
import 'widgets/social_links/social_links_section.dart';
import 'widgets/availability/availability_section.dart';
import 'widgets/contact_form/contact_form_section.dart';
import '../services/widgets/faq_section/faq_section.dart';
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

          // Contact Form
          const ContactFormSection(),

          // Calendar Integration
          const CalendarSection(),

          // Social Links
          const SocialLinksSection(),

          // FAQ section
          const FaqSection(),

          // Availability Status
          const AvailabilitySection(),

          // What Happens Next (Timeline)
          const TimelineSection(),

          // Testimonials section
          const TestimonialsSection(),
        ],
      ),
    );
  }
}
