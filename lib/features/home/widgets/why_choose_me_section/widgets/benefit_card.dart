import 'package:flutter/material.dart';
import '../../../../../utility/constants/colors.dart';
import '../../../../../data_layer/model/benefit_model.dart';
import '../../../../../utility/default_sizes/font_size.dart';
import '../../../../../utility/default_sizes/default_sizes.dart';

class BenefitCard extends StatefulWidget {
  final BenefitModel benefit;
  final int index;

  const BenefitCard({super.key, required this.benefit, required this.index});

  @override
  State<BenefitCard> createState() => _BenefitCardState();
}

class _BenefitCardState extends State<BenefitCard> with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: const Duration(milliseconds: 600), vsync: this);

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeIn));

    // Staggered animation based on index
    Future.delayed(Duration(milliseconds: 150 * widget.index), () {
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

    return FadeTransition(
      opacity: _fadeAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: _isHovered ? DColors.cardBackground : Colors.transparent,
              borderRadius: BorderRadius.circular(s.borderRadiusMd),
              border: Border.all(color: _isHovered ? DColors.primaryButton : Colors.transparent, width: 2),
              boxShadow: _isHovered
                  ? [
                      BoxShadow(
                        color: DColors.primaryButton.withAlpha((155 * 0.2).round()),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ]
                  : null,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon Container
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: _isHovered
                        ? DColors.primaryButton.withAlpha((255 * 0.2).round())
                        : DColors.primaryButton.withAlpha((255 * 0.1).round()),
                    borderRadius: BorderRadius.circular(s.borderRadiusSm),
                    border: Border.all(
                      color: _isHovered
                          ? DColors.primaryButton
                          : DColors.primaryButton.withAlpha((255 * 0.3).round()),
                      width: 2,
                    ),
                  ),
                  child: Icon(
                    widget.benefit.icon,
                    size: 28,
                    color: _isHovered ? DColors.primaryButton : DColors.textPrimary,
                  ),
                ),
                SizedBox(width: s.spaceBtwItems),

                // Text Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        widget.benefit.title,
                        style: fonts.titleMedium.rajdhani(
                          fontWeight: FontWeight.bold,
                          color: _isHovered ? DColors.primaryButton : DColors.textPrimary,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: s.paddingXs),

                      // Description
                      Text(
                        widget.benefit.description,
                        style: fonts.bodySmall.rubik(color: DColors.textSecondary, height: 1.6),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
