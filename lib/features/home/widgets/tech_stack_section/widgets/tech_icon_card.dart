import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../data_layer/model/tech_stack_model.dart';
import '../../../../../utility/constants/colors.dart';
import '../../../../../utility/default_sizes/font_size.dart';
import '../../../../../utility/default_sizes/default_sizes.dart';
import '../../../../../utility/responsive/responsive_helper.dart';

class TechIconCard extends StatefulWidget {
  final TechStackModel tech;
  final int index;

  const TechIconCard({super.key, required this.tech, required this.index});

  @override
  State<TechIconCard> createState() => _TechIconCardState();
}

class _TechIconCardState extends State<TechIconCard> with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: const Duration(milliseconds: 800), vsync: this);

    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _animationController, curve: Curves.elasticOut));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeIn));

    Future.delayed(Duration(milliseconds: widget.index * 100), () {
      if (mounted) {
        _animationController.forward();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;
    final iconSize = context.responsiveValue(mobile: 36.0, tablet: 48.0, desktop: 56.0);

    return FadeTransition(
      opacity: _fadeAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          cursor: SystemMouseCursors.click,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            padding: EdgeInsets.all(context.responsiveValue(mobile: 14, tablet: s.paddingMd, desktop: s.paddingLg)),
            decoration: BoxDecoration(
              color: _isHovered ? DColors.primaryButton.withAlpha((255 * 0.1).round()) : DColors.cardBackground,
              borderRadius: BorderRadius.circular(s.borderRadiusLg),
              border: Border.all(color: _isHovered ? DColors.primaryButton : DColors.cardBorder, width: 2),
              boxShadow: _isHovered
                  ? [
                      BoxShadow(
                        color: DColors.primaryButton.withAlpha((255 * 0.3).round()),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ]
                  : null,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Tech Icon
                Flexible(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    transform: Matrix4.identity()..scale(_isHovered ? 1.1 : 1.0),
                    //child: _buildTechIcon(iconSize),
                    child: _buildPlaceholder(iconSize),
                  ),
                ),
                SizedBox(height: s.spaceBtwItems),

                // Tech Name
                Text(
                  widget.tech.name,
                  style: fonts.bodySmall.rubik(
                    color: _isHovered ? DColors.primaryButton : DColors.textPrimary,
                    fontWeight: _isHovered ? FontWeight.w600 : FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTechIcon(double size) {
    // Check if SVG or PNG
    final isSvg = widget.tech.iconPath.endsWith('.svg');

    if (isSvg) {
      return SvgPicture.asset(
        widget.tech.iconPath,
        width: size,
        height: size,
        colorFilter: ColorFilter.mode(_isHovered ? DColors.primaryButton : DColors.textPrimary, BlendMode.srcIn),
        placeholderBuilder: (context) => _buildPlaceholder(size),
      );
    } else {
      return Image.asset(
        widget.tech.iconPath,
        width: size,
        height: size,
        color: _isHovered ? DColors.primaryButton : DColors.textPrimary,
        errorBuilder: (context, error, stackTrace) => _buildPlaceholder(size),
      );
    }
  }

  Widget _buildPlaceholder(double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: DColors.cardBorder.withAlpha((255 * 0.3).round()),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(Icons.code_rounded, size: size * 0.6, color: DColors.textSecondary),
    );
  }
}
