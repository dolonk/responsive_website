import 'package:flutter/material.dart';

class DColors {
  DColors._();

  // 🌑 Backgrounds
  static const Color scaffold = Color(0xFF0F0F0F);
  static const Color card = Color(0xFF1A1A1A);
  static const Color gradientDark = Color(0xFF1B0D26);

  // 🌈 Primary Colors
  static const Color primary = Color(0xFFFF014F);
  static const Color secondary = Color(0xFF08D9D6);

  // border
  static const Color border = Color(0x40FF014F);

  // 📝 Text
  static const Color textPrimary = Color(0xFFFAFAFA);
  static const Color textSecondary = Color(0xFF9F9F9F);
  static const Color title = Colors.white;

  // 🔘 Buttons
  static const Color buttonBackground = primary;
  static const Color buttonText = Colors.white;

  // ⭐ Stats/Highlight Text
  static const Color highlight = Color(0xFFFFC107);
  static const Color statNumber = Color(0xFFFFFFFF);
  static const Color statLabel = Color(0xFFAAAAAA);

  // 💬 Testimonials
  static const Color testimonialBg = Color(0xFF1A1A1A);
  static const Color testimonialText = textSecondary;

  // 🖼️ Gradient Helper
  static const Gradient pinkGradient = LinearGradient(
    colors: [Color(0xFFFF2E63), Color(0xFF1B0D26)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

class DiamondGradiantShape extends StatelessWidget {
  final double vector1Width;
  final double vector1Height;
  final double vector2Width;
  final double vector2Height;
  const DiamondGradiantShape({
    super.key,
    this.vector1Width = 530,
    this.vector1Height = 500,
    this.vector2Width = 440,
    this.vector2Height = 500,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // vector 1
          SizedBox(
            width: vector1Width,
            height: vector1Height,
            child: CustomPaint(
              painter: VectorTrapezoidPainter(
                gradient: const RadialGradient(
                  colors: [Color(0x33FF014F), Color(0x330F0F0F)],
                  center: Alignment.bottomCenter,
                  radius: 1.0,
                ),
              ),
            ),
          ),

          // vector 2
          SizedBox(
            width: vector2Width,
            height: vector2Height,
            child: CustomPaint(
              painter: VectorTrapezoidPainter(
                gradient: const RadialGradient(
                  colors: [Color(0x40FF014F), Color(0x40000000)],
                  center: Alignment.bottomCenter,
                  radius: 0.8,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class VectorTrapezoidPainter extends CustomPainter {
  final Gradient gradient;

  VectorTrapezoidPainter({required this.gradient});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..shader = gradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final path = Path()
      ..moveTo(size.width * 0.05, 5)
      ..lineTo(size.width * 0.95, 0)
      ..lineTo(size.width * 0.80, size.height)
      ..lineTo(size.width * 0.20, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
