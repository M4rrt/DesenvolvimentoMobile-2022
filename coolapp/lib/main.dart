/*
 * importa a engine bonfire, nossos arquivos e o flutter materials  
 */
import 'package:bonfire/bonfire.dart';
import 'package:coolapp/decorations/mesa.dart';
import 'package:coolapp/npcs/sunshine.dart';
import 'package:coolapp/player/Player.dart';
import 'package:flutter/material.dart';

// constante de tamanho de cada quadrado do mapa
const double tileSize = 32 * 2;

// função principal que vai ser execultada quando o aplicativo iniciar
void main() {
  runApp(const MyApp());
}

// nossa aplicação
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Save The Princes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      // remover o comentário abaixo para mostrar as áreas de colisão
      showCollisionArea: true,
      joystick: Joystick(
        // componente de movimentação do personagem principal
        directional: JoystickDirectional(),
        keyboardConfig: KeyboardConfig(
            keyboardDirectionalType: KeyboardDirectionalType.wasdAndArrows),
      ),
      map: WorldMapByTiled('map/map.json',
          forceTileSize: Vector2(tileSize, tileSize)),
      player: MainPlayer(),
      components: [Sunshine(Vector2(tileSize * 0, tileSize * 8.5))],
      decorations: [
        Objeto.mesa(Vector2(tileSize * 3, tileSize * 3)),
        Objeto.mesa(Vector2(tileSize * 5, tileSize * 13)),
        Objeto.mesa(Vector2(tileSize * 9, tileSize * 8)),
        Objeto.mesa(Vector2(tileSize * 12, tileSize * 3)),
        Objeto.mesa(Vector2(tileSize * 15, tileSize * 15))
      ],
    );
  }
}
