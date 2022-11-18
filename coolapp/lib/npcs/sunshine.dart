import 'package:bonfire/bonfire.dart';

import 'npcSprite.dart';

class Sunshine extends SimpleNpc with ObjectCollision {
  Sunshine(Vector2 position)
      : super(
          position: position, //required
          size: Vector2(64, 64), //required
          speed: 100,
          initDirection: Direction.right,
          animation: SimpleDirectionAnimation(
            idleLeft: NpcSprite.idleLeft,
            idleRight: NpcSprite.idleRight, //required
            runLeft: NpcSprite.idleLeft,
            runRight: NpcSprite.idleRight, //required
            idleUp: NpcSprite.idleUp,
            idleDown: NpcSprite.idleDown,
          ),
        ) {
    setupCollision(
      CollisionConfig(collisions: [
        CollisionArea.rectangle(size: Vector2(64, 64), align: Vector2(0, 0))
      ]),
    );
  }
}
