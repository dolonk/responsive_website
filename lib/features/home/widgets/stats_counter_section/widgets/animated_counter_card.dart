import 'package:flutter/material.dart';
import '../../../../../utility/constants/colors.dart';
import '../../../../../data_layer/model/stat_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../utility/default_sizes/font_size.dart';
import '../../../../../utility/default_sizes/default_sizes.dart';

class AnimatedCounterCard extends StatefulWidget {
  final StatModel stat;
  final Duration animationDuration;
  final bool startAnimation;

  const AnimatedCounterCard({
    super.key,
    required this.stat,
    this.animationDuration = const Duration(milliseconds: 2000),
    this.startAnimation = false,
  });

  @override
  State<AnimatedCounterCard> createState() => _AnimatedCounterCardState();
}

class _AnimatedCounterCardState extends State<AnimatedCounterCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.animationDuration, vsync: this);

    _animation = Tween<double>(
      begin: 0,
      end: widget.stat.value.toDouble(),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
  }

  @override
  void didUpdateWidget(AnimatedCounterCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.startAnimation && !oldWidget.startAnimation) {
      _controller.forward();
    }
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

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
        decoration: BoxDecoration(
          gradient: _isHovered
              ? LinearGradient(
                  colors: [
                    DColors.primaryButton.withAlpha((255 * 0.15).round()),
                    DColors.primaryButton.withAlpha((255 * 0.05).round()),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : LinearGradient(colors: [DColors.cardBackground, DColors.cardBackground]),
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
          children: [
            // Icon
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: DColors.primaryButton.withAlpha((255 * 0.1).round()),
                shape: BoxShape.circle,
                border: Border.all(color: DColors.primaryButton.withAlpha((255 * 0.3).round()), width: 2),
              ),
              child: Icon(
                _getIconData(widget.stat.icon),
                size: 32.sp,
                color: _isHovered ? DColors.primaryButton : DColors.textPrimary,
              ),
            ),
            SizedBox(height: s.spaceBtwItems),

            // Animated Counter
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Text(
                  '${_animation.value.toInt()}${widget.stat.suffix}',
                  style: fonts.displayLarge.rajdhani(
                    fontSize: 48.sp,
                    fontWeight: FontWeight.bold,
                    color: _isHovered ? DColors.primaryButton : DColors.textPrimary,
                  ),
                );
              },
            ),
            SizedBox(height: s.paddingSm),

            // Label
            Text(
              widget.stat.label,
              style: fonts.bodyMedium.rubik(color: DColors.textSecondary, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'projects':
        return Icons.work_outline_rounded;
      case 'clients':
        return Icons.people_outline_rounded;
      case 'platforms':
        return Icons.devices_rounded;
      case 'satisfaction':
        return Icons.star_outline_rounded;
      default:
        return Icons.check_circle_outline_rounded;
    }
  }
}
