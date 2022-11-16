import 'package:bonfire/bonfire.dart';
import 'mesa_sprite.dart';

class Mesa extends GameDecoration {
  Mesa(Vector2 position)
      :  super.withAnimation(animation: MesaSprite.mesa, position: position, size: Vector2(64, 64));
}