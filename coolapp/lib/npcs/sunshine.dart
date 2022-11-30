import 'dart:html';

import 'package:bonfire/bonfire.dart';
import 'package:coolapp/decorations/mesa.dart';
import 'package:coolapp/player/Player.dart';
import 'package:flutter/cupertino.dart';


import 'npcSprite.dart';

class Sunshine extends SimpleNpc with ObjectCollision {
  bool canMove =  true;
  bool onTable = false;
  Sunshine(Vector2 position)
      : super(
          position: position, //required
          size: Vector2(64, 64), //required
          speed: 100,
          initDirection: Direction.down,
          animation: SimpleDirectionAnimation(
            idleRight: NpcSprite.idleRight, //required
            runRight: NpcSprite.runRight, //required
            idleLeft: NpcSprite.idleLeft,
            runLeft: NpcSprite.runLeft,
            idleDown: NpcSprite.idleDown,
            runDown: NpcSprite.runDown,
            idleUp: NpcSprite.idleUp,
            runUp: NpcSprite.runUp
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
      moveRight(speed);
    }else { 

    }
    super.update(dt);
  }
  @override
  bool onCollision(GameComponent component, bool active) {
    if(component is Objeto && active == true){
        canMove= false;
        String nome = component.getName();
        if(nome == "mesa 3"){
          onTable = true;
          print("Sunshine está na mesa ? $onTable");

        }
    }
     return super.onCollision(component, active);
  }


  bool isOnTable(){ 
    return onTable;
  } 
  
}
