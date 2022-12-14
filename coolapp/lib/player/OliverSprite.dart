import 'package:bonfire/bonfire.dart';

class OliverSprite {
  static Future<SpriteAnimation> _sequenceImage(
      String fileName, double texturePosition, double texturePosition2) {
    return SpriteAnimation.load(
      'player/$fileName',
      SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.25,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(texturePosition, texturePosition2)),
    );
  }

  static Future<SpriteAnimation> get idleDown =>
      _sequenceImage('Oliver.png', 0, 0);
  static Future<SpriteAnimation> get idleUp =>
      _sequenceImage('Oliver.png', 0, 24);
  static Future<SpriteAnimation> get idleLeft =>
      _sequenceImage('Oliver.png', 0, 48);
  static Future<SpriteAnimation> get idleRight =>
      _sequenceImage('Oliver.png', 0, 72);
}
