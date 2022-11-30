import 'package:bonfire/bonfire.dart';
import 'package:coolapp/decorations/mesa.dart';
import 'package:coolapp/player/Player.dart';


import 'npcSprite.dart';

class Sunshine extends SimpleNpc with ObjectCollision {
  bool canMove =  true;
  bool isOnTable = false;
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
            runDown: NpcSprite.runDown
          ),
        ) {
    setupCollision(
      CollisionConfig(collisions: [
        CollisionArea.rectangle(size: Vector2(64, 64), align: Vector2(0, 0))
      ])
    );
  }
  @override
  void update(double dt){
    if(canMove){
      moveRight(100);
    }
    super.update(dt);
  }
  @override
  bool onCollision(GameComponent component, bool active) {
    canMove = false;
    if(component is Objeto && active == true){
        print("Shunshine hits $component"); 
    }
    return active;
  }
}
