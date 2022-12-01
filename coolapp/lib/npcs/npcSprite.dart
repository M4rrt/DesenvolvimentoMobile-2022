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
        textureSize: Vector2(48,50),
        texturePosition: Vector2(texturePosition,texturePosition2)
      ),
    );
  }
  static Future<SpriteAnimation> get idleDown => 
  _sequenceImage('Actor3.png', 480, 10, 1);
  static Future<SpriteAnimation> get runDown => 
  _sequenceImage('Actor3.png', 432, 10, 3);
  static Future<SpriteAnimation> get idleLeft => 
  _sequenceImage('Actor3.png', 480, 76, 1);
  static Future<SpriteAnimation> get runLeft => 
  _sequenceImage('Actor3.png', 432, 76, 3);
  static Future<SpriteAnimation> get idleRight => 
  _sequenceImage('Actor3.png', 480, 140, 1);
  static Future<SpriteAnimation> get runRight => 
  _sequenceImage('Actor3.png', 432, 140, 3);
  static Future<SpriteAnimation> get  idleUp => 
  _sequenceImage('Actor3.png', 480, 204, 1);
  static Future<SpriteAnimation> get  runUp => 
  _sequenceImage('Actor3.png', 432, 204, 3);
}