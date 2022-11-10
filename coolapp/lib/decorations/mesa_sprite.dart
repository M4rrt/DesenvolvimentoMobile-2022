import 'package:bonfire/bonfire.dart';

class MesaSprite {
  static Future<SpriteAnimation> get Mesa => SpriteAnimation.load(
    "atlas_32x.png",
    SpriteAnimationData.sequenced(amount: 1, stepTime: 0.1, textureSize: Vector2(32,32))
  );
}
