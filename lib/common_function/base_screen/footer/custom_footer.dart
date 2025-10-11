import 'package:flutter/material.dart';
import 'package:responsive_website/utility/responsive/responsive_widget.dart';
import 'package:responsive_website/utility/responsive/section_container.dart';
import '../../../utility/default_sizes/default_sizes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;
    return SectionContainer(
      backgroundColor: const Color(0xFF1D1D1D),
      padding: EdgeInsets.all(s.paddingMd),
      child: ResponsiveWidget(
        mobile: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildLogoAndTagline(context),
            SizedBox(height: s.spaceBtwItems),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: s.paddingMd),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 1,
                      child: _buildQuickLinks(context)),
                  Expanded(
                      flex: 2,child: _buildContactInfo(context)),
                ],
              ),
            ),
            SizedBox(height: 20),
            const Divider(color: Colors.white10, thickness: 1, height: 1),
            SizedBox(height: 20),
            _buildBottomBar(context),
          ],
        ),
        desktop: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 2, child: _buildLogoAndTagline(context)),
                Expanded(flex: 1, child: _buildQuickLinks(context)),
                Expanded(flex: 1, child: _buildContactInfo(context)),
              ],
            ),
            SizedBox(height: 40),
            const Divider(color: Colors.white10, thickness: 1, height: 1),
            SizedBox(height: 20),
            _buildBottomBar(context),
          ],
        ),
      ),
    );
  }

  // --- 1. Logo and Tagline Widget ---
  Widget _buildLogoAndTagline(BuildContext context) {
    final s = context.sizes;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'LOGO',
          style: TextStyle(color: Color(0xFFF44336), fontSize: s.titleMedium, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        // Text.rich use kora holo shob part ke ekshathe rakhar jonno (cleaner)
        Text.rich(
          TextSpan(
            style: TextStyle(fontFamily: 'RobotoMono', height: 1.3), // Font family adjust kora jete pare
            children: [
              TextSpan(
                text: 'Get Ready',
                style: TextStyle(
                  fontSize: s.displaySmall,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.5,
                ),
              ),
              TextSpan(
                text: ' To Create\n',
                style: TextStyle(fontSize: s.displayMedium, fontWeight: FontWeight.w100, color: Colors.white),
              ),
              TextSpan(
                text: 'Great',
                style: TextStyle(fontSize: s.displayMedium, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // --- 2. Quick Links Widget ---
  Widget _buildQuickLinks(BuildContext context) {
    // Data List-ta static variable hishebe rakha holo
    const List<String> links = ['Home', 'Project', 'Blog', 'About'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Link',
          style: TextStyle(
            color: Colors.white,
            fontSize: context.sizes.bodyMedium,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        // List of links using map for clean iteration
        ...links.map(
          (link) => Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: GestureDetector(
              onTap: () {},
              child: Text(
                link,
                style: TextStyle(color: Colors.white70, fontSize: context.sizes.bodySmall),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // --- 3. Contact Info Widget ---
  Widget _buildContactInfo(BuildContext context) {
    TextStyle linkStyle = TextStyle(color: Colors.white70, fontSize: context.sizes.bodySmall);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact',
          style: TextStyle(
            color: Colors.white,
            fontSize: context.sizes.bodyMedium,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Text('+880 12345 6479', style: linkStyle),
        const SizedBox(height: 10),
        Text('Email@gmail.com', style: linkStyle),
        const SizedBox(height: 10),
        Text('Nilphamari sadar, Nilphamari, Rangpur\nDhaka, Bangladesh-5300', style: linkStyle),
        const SizedBox(height: 20),
        // Social Media Icons
        Row(
          children: [
            _buildSocialIcon(context, FontAwesomeIcons.linkedin),
            _buildSocialIcon(context, FontAwesomeIcons.github),
            _buildSocialIcon(context, FontAwesomeIcons.whatsapp),
            _buildSocialIcon(context, FontAwesomeIcons.instagram),
          ],
        ),
      ],
    );
  }

  // Helper method for social icons
  Widget _buildSocialIcon(BuildContext context, IconData icon) {
    return Padding(
      padding: EdgeInsets.only(right: context.sizes.paddingMd),
      child: GestureDetector(
        onTap: () {},
        child: Icon(icon, color: Colors.white70, size: context.sizes.iconMd),
      ),
    );
  }

  // --- 4. Bottom Bar Widget ---
  Widget _buildBottomBar(BuildContext context) {
    TextStyle bottomBarTextStyle = TextStyle(color: Colors.white54, fontSize: context.sizes.bodySmall);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('© 2025 LocationIQ', style: bottomBarTextStyle),
        Row(
          children: [
            _buildBottomLink(context, 'Privacy policy'),
            const SizedBox(width: 40),
            _buildBottomLink(context, 'Terms & Conditions'),
          ],
        ),
      ],
    );
  }

  // Helper method for bottom links
  Widget _buildBottomLink(BuildContext context, String title) {
    TextStyle style = TextStyle(color: Colors.white54, fontSize: context.sizes.bodySmall);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: Text(title, style: style),
      ),
    );
  }
}
