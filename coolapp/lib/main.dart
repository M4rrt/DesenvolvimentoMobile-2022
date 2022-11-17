import 'package:bonfire/bonfire.dart';
import 'package:coolapp/decorations/mesa.dart';
import 'package:coolapp/player/Player.dart';
import 'package:flutter/material.dart';
import 'package:coolapp/npcs/sunshine.dart';

const double tileSize = 32;
void main() {
  runApp(const MyApp());
}

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
      //showCollisionArea:true,
      joystick: Joystick(
        directional: JoystickDirectional(),
        keyboardConfig: KeyboardConfig(
            keyboardDirectionalType: KeyboardDirectionalType.wasdAndArrows),
      ),
      map: WorldMapByTiled('map/map.json',
          forceTileSize: Vector2(tileSize, tileSize)),
      player: MainPlayer(),
      components: [Sunshine(Vector2(tileSize*0, tileSize*8))],
      decorations: [Objeto.mesa(Vector2(tileSize*3, tileSize*3)),Objeto.mesa(Vector2(tileSize*5,tileSize*13)),Objeto.mesa(Vector2(tileSize*9,tileSize*8)),Objeto.mesa(Vector2(tileSize*12, tileSize*3)),Objeto.mesa(Vector2(tileSize*15,tileSize*15))],
    );
  }
}