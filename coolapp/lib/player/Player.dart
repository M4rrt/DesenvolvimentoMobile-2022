// importando a bonfire
import 'package:bonfire/bonfire.dart';
// importando a sprite do nosso personagem principal 
import 'OliverSprite.dart';


// classe de personagem principal 
class MainPlayer extends SimplePlayer with ObjectCollision {
  MainPlayer()
    : super(
      position: Vector2(0, 320),
      size: Vector2(32, 32),
      // 
      animation: SimpleDirectionAnimation(
        idleRight: OliverSprite.idleRight,
        runRight: OliverSprite.idleRight,
        idleUp: OliverSprite.idleUp,
        runUp: OliverSprite.idleUp,
        idleDown: OliverSprite.idleDown,
        runDown: OliverSprite.idleDown,
        idleLeft: OliverSprite.idleLeft,
        ),
    ){
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(32,32),
            align: Vector2(0,0)
          )
        ]
      ),
    );
    }
}