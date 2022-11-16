import 'package:bonfire/bonfire.dart';

class MesaSprite {
  static Future<SpriteAnimation> get mesa => SpriteAnimation.load(
    "atlas_32x.png",
    SpriteAnimationData.sequenced(amount: 1, stepTime: 0.1, textureSize: Vector2(64,64),texturePosition: Vector2(320,128) )
  );
}
