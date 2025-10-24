import 'package:flutter/material.dart';
import '../../../../../utility/constants/colors.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../common_function/style/custom_button.dart';
import '../../../../../common_function/style/hoverable_social_icon.dart';
import 'package:responsive_website/utility/default_sizes/font_size.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';
import 'package:responsive_website/utility/responsive/responsive_helper.dart';

class IntroContent extends StatefulWidget {
  const IntroContent({super.key});

  @override
  State<IntroContent> createState() => _IntroContentState();
}

class _IntroContentState extends State<IntroContent> {
  bool _isOutlineHovered = false;

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;
    return Column(
      crossAxisAlignment: context.isDesktop ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      mainAxisAlignment: context.isDesktop ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        // "Hello" Text
        Text('Hello', style: fonts.bodyLarge.rubik(color: DColors.textPrimary)),

        // Name & Title (Animated)
        Column(
          crossAxisAlignment: context.isDesktop ? CrossAxisAlignment.start : CrossAxisAlignment.center,
          children: [
            // Static part of the text
            Text(
              "I'm Dolon km, an",
              style: fonts.displayMedium,
              textAlign: context.isDesktop ? TextAlign.start : TextAlign.center,
            ),
            // Animated part of the text
            AnimatedTextKit(
              isRepeatingAnimation: true,
              repeatForever: true,
              animatedTexts: [
                TypewriterAnimatedText(
                  'App Developer',
                  textStyle: fonts.displayMedium.rajdhani(color: DColors.primaryButton),
                  speed: const Duration(milliseconds: 150),
                  cursor: '|',
                ),
                TypewriterAnimatedText(
                  'Flutter Expert',
                  textStyle: fonts.displayMedium.rajdhani(color: DColors.primaryButton),
                  speed: const Duration(milliseconds: 150),
                  cursor: '|',
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: s.spaceBtwItems),

        // ✅ Fixed: Description with proper overflow handling
        _buildDescription(context),
        SizedBox(height: s.spaceBtwItems),

        // Action Buttons
        _buildActionButtons(context),
        SizedBox(height: s.spaceBtwItems),

        // Social Icons
        _buildSocialIcons(context),
      ],
    );
  }

  // ✅ NEW: Separate method for description with proper responsive handling
  Widget _buildDescription(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;

    const descriptionText =
        'Crafting sleek, high-performance apps with clean code and seamless user '
        'experiences. Explore my portfolio to see how I bring ideas to life through '
        'intuitive and scalable mobile applications.';

    if (context.isMobile) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: s.paddingMd),
        child: Text(
          descriptionText,
          style: fonts.bodyMedium.rubik(color: DColors.textPrimary, height: 1.6),
          textAlign: TextAlign.center,
          maxLines: 6,
          overflow: TextOverflow.ellipsis,
        ),
      );
    } else if (context.isTablet) {
      return SizedBox(
        width: context.screenWidth * 0.8,
        child: Text(
          descriptionText,
          style: fonts.bodyMedium.rubik(color: DColors.textPrimary, height: 1.5),
          textAlign: TextAlign.center,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
        ),
      );
    } else {
      // Desktop layout
      return SizedBox(
        width: context.screenWidth * 0.45,
        child: Text(
          descriptionText,
          style: fonts.bodyMedium.rubik(color: DColors.textPrimary, height: 1.5),
          textAlign: TextAlign.start,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
        ),
      );
    }
  }

  // 🎯 Action Buttons - Improved responsive sizing
  Widget _buildActionButtons(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;

    // ✅ Fixed: Button sizes based on device
    final buttonHeight = context.responsiveValue(mobile: 44.0, tablet: 48.0, desktop: 52.0);

    final buttonSpacing = context.responsiveValue(
      mobile: s.spaceBtwItems * 0.75,
      tablet: s.spaceBtwItems,
      desktop: s.spaceBtwItems * 1.2,
    );

    return Wrap(
      alignment: context.isDesktop ? WrapAlignment.start : WrapAlignment.center,
      spacing: buttonSpacing,
      runSpacing: s.spaceBtwItems * 0.5,
      children: [
        // Download CV Button
        CustomButton(height: buttonHeight, tittleText: 'Download CV', onPressed: () {}),

        // Hire Me Button
        MouseRegion(
          onEnter: (_) => setState(() => _isOutlineHovered = true),
          onExit: (_) => setState(() => _isOutlineHovered = false),
          child: SizedBox(
            height: buttonHeight,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                backgroundColor: _isOutlineHovered ? DColors.cardBorder : DColors.background,
                side: BorderSide(color: DColors.buttonBorder, width: 1.5),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(s.borderRadiusSm)),
                padding: EdgeInsets.symmetric(horizontal: s.paddingLg),
              ),
              child: Text("Hire Me", style: fonts.bodyMedium),
            ),
          ),
        ),
      ],
    );
  }

  // 🌐 Social Icons - Improved responsive spacing
  Widget _buildSocialIcons(BuildContext context) {
    final s = context.sizes;

    final socialIcons = [
      FontAwesomeIcons.linkedin,
      FontAwesomeIcons.github,
      FontAwesomeIcons.youtube,
      FontAwesomeIcons.instagram,
      FontAwesomeIcons.facebook,
    ];

    // ✅ Fixed: Icon spacing based on device
    final iconSpacing = context.responsiveValue(
      mobile: s.paddingSm,
      tablet: s.paddingMd,
      desktop: s.paddingMd * 1.2,
    );

    return Wrap(
      alignment: context.isDesktop ? WrapAlignment.start : WrapAlignment.center,
      spacing: iconSpacing,
      runSpacing: s.paddingSm,
      children: socialIcons
          .map(
            (icon) => HoverableSocialIcon(
              icon: icon,
              onTap: () {
                debugPrint("Tapped on: $icon");
              },
            ),
          )
          .toList(),
    );
  }
}
