import 'dart:ui';

import 'package:flutter/material.dart';

class TechFeedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // ─────────────────────────────────────
    // 1. Main shape
    // ─────────────────────────────────────

    final path = Path();

    path.moveTo(18, 0);

    path.lineTo(size.width, 0);

    path.lineTo(size.width, size.height - 28);

    // Bottom-right technical cut
    path.lineTo(size.width - 28, size.height);

    path.lineTo(0, size.height);

    path.lineTo(0, 18);

    path.close();

    final background = Paint()
      ..color = const Color(0xFF101216);

    canvas.drawPath(path, background);


    // ─────────────────────────────────────
    // 2. Extremely subtle border
    // ─────────────────────────────────────

    final border = Paint()
      ..color = const Color(0xFF252931)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    canvas.drawPath(path, border);


    // ─────────────────────────────────────
    // 3. Small top-left "system" marker
    // ─────────────────────────────────────

    final accent = Paint()
      ..color = const Color(0xFF70F7C4)
      ..strokeWidth = 2;

    canvas.drawLine(
      const Offset(18, 0),
      const Offset(58, 0),
      accent,
    );


    // ─────────────────────────────────────
    // 4. Tiny right-side technical marker
    // ─────────────────────────────────────

    final marker = Paint()
      ..color = const Color(0xFF383D46)
      ..strokeWidth = 1;

    canvas.drawLine(
      Offset(size.width - 1, 20),
      Offset(size.width - 1, 55),
      marker,
    );


    // ─────────────────────────────────────
    // 5. Bottom-right accent
    // ─────────────────────────────────────

    final bottomAccent = Paint()
      ..color = const Color(0xFF70F7C4)
      ..strokeWidth = 1.5;

    canvas.drawLine(
      Offset(size.width - 28, size.height),
      Offset(size.width - 8, size.height),
      bottomAccent,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}