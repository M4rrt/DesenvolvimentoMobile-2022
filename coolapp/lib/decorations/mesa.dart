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
class Objeto extends GameDecoration {
  Objeto.mesa(Vector2 position)
      /*
        Animation -> Future<SpriteAnimation> instanciada no arquivo mesa_sprite.dart
        position  -> é a posição no mapa em que essa mesa existirá no mapa
        size      -> é o tamanho dessa game decoration ela tem 64x64 pixels oque é equivalente a 4 quadrados  
      */
      :  super.withAnimation(animation: MesaSprite.mesa, position: position, size: Vector2(64, 64));
}