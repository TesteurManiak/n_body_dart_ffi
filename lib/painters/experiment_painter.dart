import 'package:flutter/material.dart';
import 'package:n_body_dart_ffi/constants.dart';
import 'package:n_body_dart_ffi/models/particles.dart';

class NBodyPainterExperiment extends CustomPainter {
  const NBodyPainterExperiment({required this.particles});

  final List<ParticleDartNative> particles;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Constants.particleColor;
    for (final particle in particles) {
      canvas.drawCircle(
        Offset(particle.posX, particle.posY),
        particle.mass / 1500,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
