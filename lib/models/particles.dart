import 'package:vector_math/vector_math_64.dart';

class ParticleDart {
  double mass;
  Vector2 pos;
  Vector2 velocity;
  double force;

  ParticleDart({
    required this.mass,
    required this.pos,
    required this.velocity,
    required this.force,
  });
}

class ParticleDartNative {
  double mass;
  double posX;
  double posY;
  double velocityX;
  double velocityY;
  double force;

  ParticleDartNative({
    required this.mass,
    required this.posX,
    required this.posY,
    required this.velocityX,
    required this.velocityY,
    required this.force,
  });
}
