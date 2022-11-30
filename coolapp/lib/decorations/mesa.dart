/* 
  importa o bonfire para poder criar uma classe que extende GameDecoration
  importa mesa sprite para pode usar o sprite Criado para a mesa
*/
import 'package:bonfire/bonfire.dart';
import 'package:flutter/animation.dart';
import 'mesa_sprite.dart';

/*
Classe Objeto feita para cria uma Game decoration
Vector2 position -> é a posição no mapa em que essa Objeto existirá no mapa 
*/
class Objeto extends GameDecoration with ObjectCollision {
  String nome ="";
  Objeto.mesa(Vector2 position, String name)
      /*
        Animation -> Future<SpriteAnimation> instanciada no arquivo mesa_sprite.dart
        position  -> é a posição no mapa em que essa mesa existirá no mapa
        size      -> é o tamanho dessa game decoration ela tem 128x128 pixels oque é equivalente a 4 quadrados  
      */
      : super.withAnimation(
            animation: MesaSprite.mesa,
            position: position,
            size: Vector2(128, 128),
      ) {
        setupCollision(
          CollisionConfig(collisions: [
             CollisionArea.rectangle(size: Vector2(128, 128), align: Vector2(0, 0))
          ]));
        setnome(name);
      }
      
       setnome(String nome) {
          this.nome = nome;
      }
      String getName(){
        return nome;
      }
}
