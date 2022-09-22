import 'package:bonfire/bonfire.dart';


import 'OliverSprite.dart';

class MainPlayer extends SimplePlayer with ObjectCollision {
  MainPlayer()
    : super(
      position: Vector2(0, 320),
      size: Vector2(96, 96),
      animation: SimpleDirectionAnimation(
        idleRight: OliverSprite.idleRight,
        runRight: OliverSprite.idleRight,
        idleUp: OliverSprite.idleUp,
        idleDown: OliverSprite.idleDown,
        idleLeft: OliverSprite.idleLeft,
        ),
    ){
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(16,32),
            align: Vector2(40,32)
          )
        ]
      ),
    );
    }
}