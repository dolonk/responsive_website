import 'package:flutter/material.dart';
import 'package:responsive_website/utility/constants/colors.dart';
import 'package:responsive_website/utility/default_sizes/font_size.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';
import 'package:responsive_website/utility/responsive/responsive_helper.dart';

class YearCard extends StatefulWidget {
  final int year;
  final String description;
  final int index;

  const YearCard({super.key, required this.year, required this.description, this.index = 0});

  @override
  State<YearCard> createState() => _YearCardState();
}

class _YearCardState extends State<YearCard> with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: const Duration(milliseconds: 800), vsync: this);

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    Future.delayed(Duration(milliseconds: 200 * widget.index), () {
      if (mounted) {
        _controller.forward();
      }
    });
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

    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: AnimatedScale(
            duration: const Duration(milliseconds: 200),
            scale: _isHovered ? 1.02 : 1.0,
            child: Container(
              margin: context.isTablet ? EdgeInsets.all(s.paddingMd): EdgeInsets.only(bottom: s.spaceBtwItems -6),
              padding: EdgeInsets.all(
                context.responsiveValue(mobile: s.paddingMd, tablet: s.paddingLg, desktop: 10),
              ),
              decoration: BoxDecoration(
                color: DColors.cardBackground,
                borderRadius: BorderRadius.circular(s.borderRadiusLg),
                border: Border.all(
                  color: _isHovered ? DColors.primaryButton : DColors.cardBorder,
                  width: 1.5,
                ),
                boxShadow: _isHovered
                    ? [
                        BoxShadow(
                          color: DColors.primaryButton.withAlpha((255 * 0.2).round()),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : null,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Year
                  Text(
                    widget.year.toString(),
                    style: fonts.headlineLarge.rajdhani(
                      color: DColors.primaryButton,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height:context.isDesktop ? 4: s.paddingSm),

                  // Description
                  Flexible(
                    child: Text(
                      widget.description,
                      style: fonts.bodyMedium.rubik(color: DColors.textSecondary),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
