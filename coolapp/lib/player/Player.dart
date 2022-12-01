// importando a bonfire
import 'package:bonfire/bonfire.dart';
import 'package:coolapp/npcs/sunshine.dart';
import 'package:coolapp/decorations/mesa.dart';
import 'package:flutter/foundation.dart';
// importando a sprite do nosso personagem principal
import 'OliverSprite.dart';

// classe de personagem principal
class MainPlayer extends SimplePlayer with ObjectCollision {
  bool npcHit = false;
  bool stopMove = false;
  MainPlayer(Vector2 position)
      : super(
          position: position,
          size: Vector2(64, 64),
          speed: 200,
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
        ) {
    setupCollision(
      CollisionConfig(collisions: [
        CollisionArea.rectangle(size: Vector2(32, 32), align: Vector2(16, 14))
      ]),
    );
  }
  @override
  bool onCollision(GameComponent component, bool active) {
    // TODO: implement onCollision
    if(component is Sunshine) {
      if(!npcHit){
        print("teste " + component.isOnTable().toString() + " " + active.toString() );
        npcHit = true;
      }
    }
    return super.onCollision(component, active);
  }
  bool canMove(bool status){
    if(!status){ 
      speed = 0;
    } else { 
      speed = 200;
    }
    return status;
  }
}
