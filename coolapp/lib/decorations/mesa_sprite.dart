import 'package:bonfire/bonfire.dart';


/*
 *   MesaSprite é uma classe que instancia sprite animations para gameDecoration
 */
class MesaSprite {
  /*
   * cria uma future<spriteanimation> chamada mesa
   * recebendo um arquivo de imagem  "atlas_32x.png"
   * e uma sprite animationsprite animation data
   */
  static Future<SpriteAnimation> get mesa => SpriteAnimation.load(
    "atlas_32x.png",
    SpriteAnimationData.sequenced(amount: 1, stepTime: 0.1, textureSize: Vector2(64,64),texturePosition: Vector2(320,128) )
  );
}
