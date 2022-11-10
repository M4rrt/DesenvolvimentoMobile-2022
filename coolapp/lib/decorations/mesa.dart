import 'package:bonfire/bonfire.dart';
import 'mesa_sprite.dart';

class Mesa extends GameDecoration {
  Mesa(Vector2 position)
      :  super.withAnimation(animation: MesaSprite.Mesa, position: position, size: Vector2(32, 32));
}