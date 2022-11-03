import 'package:bonfire/bonfire.dart';

class Mesa extends GameDecoration {
  Mesa(Vector2 position, sprite,size)
      :  super.withSprite(
        sprite: sprite,
        position: position,
        size: size
      );
}