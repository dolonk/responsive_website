import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_website/utility/constants/colors.dart';
import 'package:responsive_website/utility/default_sizes/font_size.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';
import 'package:responsive_website/utility/responsive/responsive_helper.dart';
import 'package:responsive_website/utility/responsive/responsive_widget.dart';
import 'package:responsive_website/utility/responsive/section_container.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      padding: EdgeInsets.symmetric(horizontal: context.sizes.paddingMd),
      backgroundColor: DColors.background,
      child: ResponsiveWidget(
        mobile: _buildMobileLayout(context),
        tablet: _buildTabletLayout(context),
        desktop: _buildDesktopLayout(context),
      ),
    );
  }

  // 📱 Mobile Layout
  Widget _buildMobileLayout(BuildContext context) {
    return SizedBox(
      height: 700,
      child: Column(
        children: [
          Expanded(flex: 3, child: _heroImage(context)),
          Expanded(flex: 2, child: _introContent(context)),
        ],
      ),
    );
  }

  // 📱 Tablet Layout
  Widget _buildTabletLayout(BuildContext context) {
    return SizedBox(
      height: 800,
      child: Column(
        children: [
          Expanded(flex: 3, child: _heroImage(context)),
          Expanded(flex: 2, child: _introContent(context)),
        ],
      ),
    );
  }

  // 💻 Desktop Layout
  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 3, child: _introContent(context)),
        Expanded(flex: 2, child: _heroImage(context)),
      ],
    );
  }

  // 📝 Intro Content Section
  Widget _introContent(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;

    return Column(
      crossAxisAlignment: context.isDesktop ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      mainAxisAlignment: context.isDesktop ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        // "Hello" Text
        Text('Hello', style: fonts.bodyLarge.rubik(color: DColors.textPrimary)),
        SizedBox(height: s.spaceBtwItems),

        // Name & Title
        Text.rich(
          TextSpan(
            text: "I'm Dolon km, an \n",
            style: fonts.displayMedium,
            children: [
              TextSpan(
                text: '  App Developer',
                style: fonts.displayMedium.rajdhani(color: DColors.primaryButton),
              ),
            ],
          ),
          textAlign: context.isDesktop ? TextAlign.start : TextAlign.center,
        ),
        SizedBox(height: s.spaceBtwItems),

        // Description
        Text(
          'Crafting sleek, high-performance apps with clean code and seamless user\n'
          'experiences. Explore my portfolio to see how I bring ideas to life through\n'
          'intuitive and scalable mobile applications.',
          style: fonts.bodyMedium,
          textAlign: context.isDesktop ? TextAlign.start : TextAlign.center,
        ),
        SizedBox(height: s.spaceBtwItems),

        // Action Buttons
        _buildActionButtons(context),
        SizedBox(height: s.spaceBtwItems),

        // Social Icons
        _buildSocialIcons(context),
      ],
    );
  }

  // 🖼️ Hero Image Section
  Widget _heroImage(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Diamond Background Gradient
        DiamondGradiantShape(
          vector1Width: context.responsive(mobile: 400, tablet: 500, desktop: 530),
          vector1Height: context.responsive(mobile: 450, tablet: 450, desktop: 500),
          vector2Width: context.responsive(mobile: 350, tablet: 420, desktop: 440),
          vector2Height: context.responsive(mobile: 450, tablet: 450, desktop: 500),
        ),

        // APP DEVELOPMENT Text
        Positioned(
          top: context.responsive(mobile: 110, tablet: 110, desktop: 80),
          child: Text("APP DEVELOPMENT", style: context.fonts.displayLarge),
        ),

        // Hero Image
        Image.asset(
          'assets/home/hero_section/dk.png',
          height: context.responsive(mobile: 450, tablet: 450, desktop: 500),
          fit: BoxFit.cover,
        ),

        // FLUTTER EXPERT Text (Stroke)
        Positioned(
          bottom: context.responsive(mobile: 54, tablet: 20, desktop: 20),
          child: Text(
            "FLUTTER EXPERT",
            style: context.fonts.displayLarge.copyWith(
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 1
                ..color = DColors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }

  // 🎯 Action Buttons
  Widget _buildActionButtons(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;

    return Row(
      mainAxisAlignment: context.isDesktop ? MainAxisAlignment.start : MainAxisAlignment.center,
      children: [
        // Download CV Button
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: DColors.primaryButton,
            padding: EdgeInsets.symmetric(horizontal: s.paddingMd, vertical: 18),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(s.borderRadiusSm)),
          ),
          child: Text("Download CV", style: fonts.bodyMedium.rubik(color: DColors.textPrimary)),
        ),
        SizedBox(width: s.spaceBtwItems),

        // Hire Me Button
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: DColors.buttonBorder, width: 1.5),
            padding: EdgeInsets.symmetric(horizontal: s.paddingMd, vertical: 18),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(s.borderRadiusSm)),
          ),
          child: Text("Hire Me", style: fonts.bodyMedium),
        ),
      ],
    );
  }

  // 🌐 Social Icons
  Widget _buildSocialIcons(BuildContext context) {
    final s = context.sizes;

    final socialIcons = [
      FontAwesomeIcons.linkedin,
      FontAwesomeIcons.github,
      FontAwesomeIcons.youtube,
      FontAwesomeIcons.instagram,
      FontAwesomeIcons.facebook,
    ];

    return Row(
      mainAxisAlignment: context.isDesktop ? MainAxisAlignment.start : MainAxisAlignment.center,
      children: socialIcons
          .map(
            (icon) => Padding(
              padding: EdgeInsets.only(right: s.paddingSm),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    // Add social link navigation
                  },
                  child: Icon(icon, color: DColors.textPrimary, size: s.iconMd),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
