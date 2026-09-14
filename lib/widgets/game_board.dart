//Displays the map

import 'package:flutter/material.dart';
import '../game/game_map.dart';
import '../models/player.dart';

class GameBoard extends StatelessWidget {
  final Player player;

  const GameBoard({
    super.key,
    required this.player,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: GameMap.columns,
        ),
        itemCount: GameMap.rows * GameMap.columns,
        itemBuilder: (context, index) {
          final int row = index ~/ GameMap.columns;
          final int column = index % GameMap.columns;

          final bool isPlayer =
              row == player.row && column == player.column;

          final bool isWall = GameMap.isWall(row, column);

          return Container(
            decoration: BoxDecoration(
              color: isWall
                  ? Colors.brown.shade700
                  : Colors.grey.shade800,
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
            alignment: Alignment.center,
            child: isPlayer
                ? const Text(
              '🧙',
              style: TextStyle(fontSize: 28),
            )
                : isWall
                ? const Text(
              '🧱',
              style: TextStyle(fontSize: 20),
            )
                : null,
          );
        },
      ),
    );
  }
}