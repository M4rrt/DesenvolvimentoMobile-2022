// importando a bonfire
import 'package:bonfire/bonfire.dart';
import 'package:coolapp/npcs/sunshine.dart';
import 'package:coolapp/decorations/mesa.dart';
// importando a sprite do nosso personagem principal
import 'OliverSprite.dart';

// classe de personagem principal
class MainPlayer extends SimplePlayer with ObjectCollision {
  MainPlayer(Vector2 position)
      : super(
          position: position,
          size: Vector2(64, 64),
          speed: 350,
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
      print(component.isOnTable());
    }
    print("oliver hits $component $active");
    return super.onCollision(component, active);
  }
}
