import 'package:flutter/material.dart';
import '../../../../../utility/constants/colors.dart';
import 'package:responsive_website/utility/default_sizes/font_size.dart';

class AnimatedCounter extends StatefulWidget {
  final int targetValue;
  final Duration duration;
  final Duration delay;
  final TextStyle? textStyle;
  final String suffix;

  const AnimatedCounter({
    super.key,
    required this.targetValue,
    this.duration = const Duration(milliseconds: 2000),
    this.delay = Duration.zero,
    this.textStyle,
    this.suffix = '+',
  });

  @override
  State<AnimatedCounter> createState() => _AnimatedCounterState();
}

class _AnimatedCounterState extends State<AnimatedCounter> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _counterAnimation;
  bool _hasStarted = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: widget.duration, vsync: this);

    _counterAnimation = IntTween(
      begin: 0,
      end: widget.targetValue,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    // Start animation after delay
    Future.delayed(widget.delay, () {
      if (mounted && !_hasStarted) {
        _hasStarted = true;
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
    return AnimatedBuilder(
      animation: _counterAnimation,
      builder: (context, child) {
        return Text(
          '${_counterAnimation.value}${widget.suffix}',
          style:
              widget.textStyle ??
              context.fonts.displayMedium.rajdhani(color: DColors.primaryButton, fontWeight: FontWeight.bold),
        );
      },
    );
  }
}
