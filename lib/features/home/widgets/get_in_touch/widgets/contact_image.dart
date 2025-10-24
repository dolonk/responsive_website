import 'package:flutter/material.dart';

class AnimatedContactImage extends StatefulWidget {
  final double height;

  const AnimatedContactImage({super.key, required this.height});

  @override
  State<AnimatedContactImage> createState() => _AnimatedContactImageState();
}

class _AnimatedContactImageState extends State<AnimatedContactImage> with SingleTickerProviderStateMixin {
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
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 400),
      opacity: 0.9,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Image.asset(
          "assets/home/projects/contact.png",
          height: widget.height,
          fit: BoxFit.cover,
          cacheHeight: widget.height.toInt(),
          filterQuality: FilterQuality.medium,
          errorBuilder: (context, error, stackTrace) {
            debugPrint('❌ Failed to load contact image');
            return Container(
              height: widget.height,
              width: widget.height * 0.8,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Icon(Icons.person_outline, size: widget.height * 0.4, color: Colors.white54),
            );
          },
        ),
      ),
    );
  }
}
