import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:responsive_website/utility/constants/colors.dart';
import 'package:responsive_website/utility/default_sizes/font_size.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';
import 'package:responsive_website/utility/responsive/responsive_helper.dart';
import 'package:responsive_website/utility/responsive/section_container.dart';
import 'package:responsive_website/data_layer/model/contact_info_model.dart';
import 'widgets/contact_info_card.dart';
import 'widgets/phone_options_modal.dart';

class DirectContactSection extends StatelessWidget {
  const DirectContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;

    return SectionContainer(
      padding: EdgeInsets.symmetric(horizontal: s.paddingMd, vertical: s.spaceBtwSections),
      child: Column(
        children: [
          // Section Heading
          _buildSectionHeading(context, s),
          SizedBox(height: s.spaceBtwSections),

          // Contact Info Cards Grid
          _buildContactInfoGrid(context, s),
        ],
      ),
    );
  }

  /// Section Heading
  Widget _buildSectionHeading(BuildContext context, DSizes s) {
    final fonts = context.fonts;

    return Column(
      children: [
        Text(
          'Direct Contact Information',
          style: fonts.headlineLarge.rajdhani(
            fontSize: context.responsiveValue(mobile: 28, tablet: 32, desktop: 36),
            fontWeight: FontWeight.bold,
            color: DColors.textPrimary,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: s.paddingSm),
        Container(
          constraints: BoxConstraints(
            maxWidth: context.responsiveValue(mobile: double.infinity, tablet: 600, desktop: 700),
          ),
          child: Text(
            'Prefer direct communication? Reach out anytime through your preferred channel',
            style: fonts.bodyLarge.rubik(color: DColors.textSecondary, height: 1.6),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.1, duration: 600.ms);
  }

  /// Contact Info Cards Grid
  Widget _buildContactInfoGrid(BuildContext context, DSizes s) {
    final contactInfoList = _getContactInfo(context);
    final crossAxisCount = context.responsiveValue(mobile: 1, tablet: 3, desktop: 3);
    final spacing = s.spaceBtwItems;

    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = context.isMobile
            ? double.infinity
            : (constraints.maxWidth - (spacing * (crossAxisCount - 1))) / crossAxisCount;

        return AnimationLimiter(
          child: Wrap(
            spacing: spacing,
            runSpacing: spacing,
            alignment: WrapAlignment.center,
            children: List.generate(contactInfoList.length, (index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 500),
                child: SlideAnimation(
                  verticalOffset: 30.0,
                  child: FadeInAnimation(
                    child: SizedBox(
                      width: context.isMobile ? double.infinity : cardWidth,
                      height: context.responsiveValue(mobile: 240, tablet: 260, desktop: 280),
                      child: ContactInfoCard(info: contactInfoList[index]),
                    ),
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }

  /// Get Contact Info Data
  List<ContactInfoModel> _getContactInfo(BuildContext context) {
    return [
      // Email
      ContactInfoModel(
        title: 'Email Address',
        value: 'your.email@domain.com', // TODO: Replace with your actual email
        description: 'For general inquiries',
        icon: Icons.email_rounded,
        accentColor: const Color(0xFF8B5CF6), // Purple
        onTap: () => _launchEmail(),
      ),

      // Phone/WhatsApp
      ContactInfoModel(
        title: 'Phone/WhatsApp',
        value: '+880 XXXX-XXXXXX', // TODO: Replace with your actual phone
        description: 'Available 9 AM - 6 PM (GMT+6)',
        icon: Icons.phone_rounded,
        accentColor: const Color(0xFF3B82F6), // Blue
        onTap: () => _showPhoneOptions(context),
      ),

      // Location
      ContactInfoModel(
        title: 'Location',
        value: 'Dhaka, Bangladesh',
        description: 'Available for remote work globally',
        icon: Icons.location_on_rounded,
        accentColor: const Color(0xFF10B981), // Green
        onTap: null, // No action - informational only
      ),
    ];
  }

  /// Launch Email (mailto)
  void _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'your.email@domain.com', // TODO: Replace with your actual email
      query: 'subject=Project Inquiry&body=Hello,', // Pre-filled subject and body
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      debugPrint('Could not launch email client');
    }
  }

  /// Show Phone Options Modal
  void _showPhoneOptions(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => PhoneOptionsModal(
        phoneNumber: '+8801XXXXXXXXX',
      ),
    );
  }
}
