import 'package:flutter/material.dart';

class OvalPainter extends CustomPainter {
  final double width;
  final double height;

  OvalPainter({
    required this.width,
    required this.height,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFE0ECFF) // Color of the oval
      ..style = PaintingStyle.fill; // Fill style

    final rect = Rect.fromLTWH(-width * 0.25, height * 0.02, width, height);
    canvas.drawOval(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // Return true if the painter should repaint (e.g., on state changes)
  }
}