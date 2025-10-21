import 'package:flutter/material.dart';
import '../../../../../utility/constants/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_website/utility/default_sizes/font_size.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';
import 'package:responsive_website/utility/responsive/responsive_helper.dart';

class IntroContent extends StatelessWidget {
  const IntroContent({super.key});

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
        context.isMobile
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: s.paddingMd),
                child: Text(
                  'Crafting sleek, high-performance apps with clean code and seamless user'
                  'experiences. Explore my portfolio to see how I bring ideas to life through'
                  'intuitive and scalable mobile applications.',
                  style: fonts.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              )
            : Text(
                'Crafting sleek, high-performance apps with clean code and seamless user\n'
                'experiences. Explore my portfolio to see how I bring ideas to life through\n'
                'intuitive and scalable mobile applications.',
                style: fonts.bodyMedium,
                textAlign: TextAlign.start,
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
            padding: EdgeInsets.all(s.paddingMd),
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
            padding: EdgeInsets.all(s.paddingMd),
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
              padding: EdgeInsets.only(right: s.paddingMd),
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
