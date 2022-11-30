import 'package:bonfire/bonfire.dart';

class NpcSprite {
  static Future<SpriteAnimation> _sequenceImage(
    String fileName,
    double texturePosition,
    double texturePosition2,
    int amount
  ){
    return SpriteAnimation.load(
      'npc/sprites/$fileName',
      SpriteAnimationData.sequenced(
        amount: amount,
        stepTime: 0.50,
        textureSize: Vector2(48,48),
        texturePosition: Vector2(texturePosition,texturePosition2)
      ),
    );
  }
  static Future<SpriteAnimation> get idleDown => 
  _sequenceImage('Actor3.png', 432, 12,1);
  static Future<SpriteAnimation> get runDown => 
  _sequenceImage('Actor3.png', 432, 12,3);
  static Future<SpriteAnimation> get  idleUp => 
  _sequenceImage('Actor3.png', 432, 12,1);
  static Future<SpriteAnimation> get idleLeft => 
  _sequenceImage('Actor3.png', 432, 12,1);
  static Future<SpriteAnimation> get idleRight => 
  _sequenceImage('Actor3.png', 432, 12,1);
}