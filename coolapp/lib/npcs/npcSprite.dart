import 'package:bonfire/bonfire.dart';

class NpcSprite {
  static Future<SpriteAnimation> _sequenceImage(
    String fileName,
    double texturePosition,
    double texturePosition2,
  ){
    return SpriteAnimation.load(
      'npc/sprites/$fileName',
      SpriteAnimationData.sequenced(
        amount: 3,
        stepTime: 0.50,
        textureSize: Vector2(48,48),
        texturePosition: Vector2(texturePosition,texturePosition2)
      ),
    );
  }
  static Future<SpriteAnimation> get idleDown => 
  _sequenceImage('Actor3.png', 432, 12);
  static Future<SpriteAnimation> get  idleUp => 
  _sequenceImage('Actor3.png', 432, 12);
  static Future<SpriteAnimation> get idleLeft => 
  _sequenceImage('Actor3.png', 432, 12);
  static Future<SpriteAnimation> get idleRight => 
  _sequenceImage('Actor3.png', 432, 12);
}