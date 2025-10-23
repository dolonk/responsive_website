import 'package:flutter/material.dart';
import '../../../../../utility/constants/colors.dart';
import 'package:responsive_website/utility/default_sizes/font_size.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';
import 'package:responsive_website/utility/responsive/responsive_helper.dart';

class GetInTouchCard extends StatefulWidget {
  final double height;
  final double imageHeight;
  final Alignment imageAlignment;
  final double imageTopOffset;
  final double imageRightOffset;

  const GetInTouchCard({
    super.key,
    required this.height,
    required this.imageHeight,
    required this.imageAlignment,
    required this.imageTopOffset,
    required this.imageRightOffset,
  });

  @override
  State<GetInTouchCard> createState() => _GetInTouchCardState();
}

class _GetInTouchCardState extends State<GetInTouchCard> with TickerProviderStateMixin {
  bool _isHovered = false;
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: const Duration(milliseconds: 1200), vsync: this);

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.05,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      width: double.infinity,
      height: widget.height,
      padding: EdgeInsets.all(context.responsiveValue(mobile: 24, tablet: 32, desktop: 40)),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFAB2E66), Color(0xFF834BA3), Color(0xFF3F397E)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(s.borderRadiusLg),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((255 * 0.3).round()),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
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
              MouseRegion(
                onEnter: (_) => setState(() => _isHovered = true),
                onExit: (_) => setState(() => _isHovered = false),
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: _isHovered ? DColors.buttonBorder : Colors.white),
                    backgroundColor: Colors.transparent,
                    padding: EdgeInsets.all(s.paddingMd),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                  ),
                  child: Text(
                    "Contact Us",
                    style: fonts.labelLarge.rubik(
                      color: _isHovered ? DColors.primaryButton : DColors.textPrimary,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Background Image
          Positioned(
            top: widget.imageTopOffset,
            right: widget.imageRightOffset,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 400),
              opacity: 0.9,
              child: ScaleTransition(
                scale: _scaleAnimation,
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
    );
  }
}
