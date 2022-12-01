import 'dart:html';

import 'package:bonfire/bonfire.dart';
import 'package:coolapp/decorations/mesa.dart';
import 'package:coolapp/main.dart';
import 'package:coolapp/player/OliverSprite.dart';
import 'package:coolapp/player/Player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'npcSprite.dart';

class Sunshine extends SimpleNpc with ObjectCollision {
  bool canMove =  true;
  bool onTable = false;
  bool playerClose = false;
  bool wantCoffee = false;
  double coffesize = 50;
  bool leave = false;
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
    if(canMove && !onTable){
      canMove = moveRight(speed);
      super.update(dt);
    }else { 
      idle();
      seePlayer(
        observed: (player){
          if(!playerClose && wantCoffee){
            playerClose = true;
            if (showDialog()){
              leave = true;
            }
          }
        },notObserved: (){
          playerClose = false;
        }, radiusVision: tileSize*2.75);
    }
    if(onTable && !wantCoffee){ 
      wantCoffee = true;
      FollowerWidget.show(
        identify: "identify",
        align: const Offset(35, -40),
        context: context,
        target: this,
        child: Card(
          color: Colors.transparent,
          shadowColor: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [Icon(Icons.coffee, color: const Color.fromARGB(255, 88, 34, 18),size: coffesize)]),
          )
        ),
      );
      super.update(dt);
    }
    if(onTable && wantCoffee && leave){ 
      canMove = true;
       if(canMove && leave){
          canMove = moveLeft(speed);
          print("saindo");
      }
       if(!canMove && leave) {
        removeFromParent();
       }
      super.update(dt);
    }
  }
  @override
  void render(Canvas canvas){
    super.render(canvas);
  }
  @override
  bool onCollision(GameComponent component, bool active) {
    if(component is Objeto && active == true){
        String nome = component.getName();
        if(nome == "mesa 3"){
          onTable = true;
          print("Sunshine está na mesa ? $onTable");

        }
    }
     return super.onCollision(component, active);
  }

   showDialog(){
    speed = 25;
    TalkDialog.show(context, [
      Say(
        text: [
          const TextSpan(text: "Eu quero um café "),],
          person: SizedBox(
            height: 100,
            width: 100,
            child:  NpcSprite.idleRight.asWidget()
          ),
      ),
      Say(
        text: [
          const TextSpan(text: "Infelizmente o café acabou"),],
          person: SizedBox(
            height: 100,
            width: 100,
            child:  OliverSprite.idleLeft.asWidget(),
          ),
          personSayDirection: PersonSayDirection.RIGHT,
      ),
      Say(
        text: [
          const TextSpan(text: "quero CAFÉÉÉÉÉ quero CAFÉÉÉÉÉ quero CAFÉÉÉÉÉ ÉÉÉÉÉ "),],
          person: SizedBox(
            height: 100,
            width: 100,
            child:  NpcSprite.idleRight.asWidget()
          ),
      ),
    ]);
    return true;
  }


  bool isOnTable(){ 
    return onTable;
  } 
  
}