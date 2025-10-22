import 'package:flutter/material.dart';
import 'package:responsive_website/utility/constants/colors.dart';
import 'package:responsive_website/utility/default_sizes/font_size.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';
import 'package:responsive_website/utility/responsive/responsive_helper.dart';
import 'package:responsive_website/utility/responsive/responsive_widget.dart';
import 'package:responsive_website/utility/responsive/section_container.dart';

class GetInTouchSection extends StatelessWidget {
  const GetInTouchSection({super.key});

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;

    return SectionContainer(
      backgroundColor: DColors.background,
      padding: EdgeInsets.symmetric(horizontal: s.paddingMd, vertical: s.spaceBtwSections),
      child: ResponsiveWidget(
        mobile: _buildMobileLayout(context),
        tablet: _buildTabletLayout(context),
        desktop: _buildDesktopLayout(context),
      ),
    );
  }

  // 📱 Mobile Layout
  Widget _buildMobileLayout(BuildContext context) {
    return _GetInTouchCard(
      height: 400,
      imageHeight: 200,
      imageAlignment: Alignment.topRight,
      imageTopOffset: -40,
      imageRightOffset: 20,
    );
  }

  // 📱 Tablet Layout
  Widget _buildTabletLayout(BuildContext context) {
    return _GetInTouchCard(
      height: 350,
      imageHeight: 250,
      imageAlignment: Alignment.topRight,
      imageTopOffset: -60,
      imageRightOffset: 40,
    );
  }

  // 💻 Desktop Layout
  Widget _buildDesktopLayout(BuildContext context) {
    return _GetInTouchCard(
      height: 320,
      imageHeight: 300,
      imageAlignment: Alignment.topRight,
      imageTopOffset: -80,
      imageRightOffset: 60,
    );
  }
}

// ══════════════════════════════════════════════════════════════════════
// 🎴 GET IN TOUCH CARD
// ══════════════════════════════════════════════════════════════════════

class _GetInTouchCard extends StatefulWidget {
  final double height;
  final double imageHeight;
  final Alignment imageAlignment;
  final double imageTopOffset;
  final double imageRightOffset;

  const _GetInTouchCard({
    required this.height,
    required this.imageHeight,
    required this.imageAlignment,
    required this.imageTopOffset,
    required this.imageRightOffset,
  });

  @override
  State<_GetInTouchCard> createState() => _GetInTouchCardState();
}

class _GetInTouchCardState extends State<_GetInTouchCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        width: double.infinity,
        height: widget.height,
        padding: EdgeInsets.all(context.responsiveValue(mobile: 24, tablet: 32, desktop: 40)),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: _isHovered
                ? [
                    DColors.primaryButton,
                    DColors.primaryButton.withOpacity(0.8),
                    DColors.primaryButton.withOpacity(0.6),
                  ]
                : [Color(0xFFAB2E66), Color(0xFF834BA3), Color(0xFF3F397E)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(s.borderRadiusLg),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: DColors.primaryButton.withOpacity(0.4),
                    blurRadius: 24,
                    offset: const Offset(0, 12),
                  ),
                ]
              : [BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 16, offset: const Offset(0, 8))],
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [

            // Content
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Heading
                Text(
                  "Have Any Projects in Mind?",
                  style: fonts.displayMedium.rajdhani(
                    fontWeight: FontWeight.w500,
                    color: Colors.white.withAlpha((255 * 0.95).round()),
                  ),
                ),

                // Main Title
                Text("Get in Touch", style: fonts.displayLarge),
                SizedBox(height: s.spaceBtwSections),

                // Contact Button
                //_ContactButton(isParentHovered: _isHovered),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.white),
                    backgroundColor: Colors.transparent,
                    padding: EdgeInsets.all(s.paddingMd),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                  ),
                  child: Text("Contact Us", style: fonts.labelLarge),
                ),
              ],
            ),

            // Background Image
            Positioned(
              top: widget.imageTopOffset,
              right: widget.imageRightOffset,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 400),
                opacity: _isHovered ? 0.9 : 0.7,
                child: AnimatedScale(
                  duration: const Duration(milliseconds: 400),
                  scale: _isHovered ? 1.05 : 1.0,
                  child: Image.asset(
                    "assets/home/projects/contact.png",
                    height: widget.imageHeight,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════════
// 🔘 CONTACT BUTTON
// ══════════════════════════════════════════════════════════════════════

/*class _ContactButton extends StatefulWidget {
  final bool isParentHovered;

  const _ContactButton({required this.isParentHovered});

  @override
  State<_ContactButton> createState() => _ContactButtonState();
}

class _ContactButtonState extends State<_ContactButton> {
  bool _isButtonHovered = false;

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;

    return MouseRegion(
      onEnter: (_) => setState(() => _isButtonHovered = true),
      onExit: (_) => setState(() => _isButtonHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          padding: EdgeInsets.all(s.paddingSm),
          decoration: BoxDecoration(
            color: _isButtonHovered ? Colors.white : Colors.transparent,
            border: Border.all(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(s.borderRadiusSm),
            boxShadow: _isButtonHovered
                ? [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Contact Us",
                style: fonts.bodyLarge.rubik(
                  fontWeight: FontWeight.w600,
                  color: _isButtonHovered ? DColors.primaryButton : Colors.white,
                ),
              ),
              SizedBox(width: s.paddingSm),
              AnimatedRotation(
                duration: const Duration(milliseconds: 300),
                turns: _isButtonHovered ? 0.125 : 0,
                child: Icon(
                  Icons.arrow_forward,
                  color: _isButtonHovered ? DColors.primaryButton : Colors.white,
                  size: context.responsiveValue(mobile: 18, tablet: 20, desktop: 22),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/
