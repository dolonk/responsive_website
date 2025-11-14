import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class FloatingIcon extends StatefulWidget {
  final String icon;
  final int delay;

  const FloatingIcon({super.key, required this.icon, this.delay = 0});

  @override
  State<FloatingIcon> createState() => _FloatingIconState();
}

class _FloatingIconState extends State<FloatingIcon> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Float up and down animation
    _controller = AnimationController(duration: const Duration(seconds: 3), vsync: this)
      ..repeat(reverse: true);

    _animation = Tween<double>(
      begin: -10.0,
      end: 10.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, _animation.value),
              child: Text(
                widget.icon,
                style: TextStyle(
                  fontSize: 40,
                  shadows: [Shadow(color: Colors.white.withOpacity(0.5), blurRadius: 20)],
                ),
              ),
            );
          },
        )
        .animate(delay: Duration(milliseconds: widget.delay))
        .fadeIn(duration: 800.ms)
        .scale(begin: Offset(0.0, 0.0), duration: 800.ms, curve: Curves.elasticOut);
  }
}
