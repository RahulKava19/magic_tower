//Displays the map

import 'package:flutter/material.dart';
import '../game/game_map.dart';
import '../models/door.dart';
import '../models/key.dart';
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

          final KeyItem? keyItem = GameMap.getKeyAt(row, column);

          final Door? door = GameMap.getDoorAt(row, column);

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
            child: _buildCellContent(
              isPlayer: isPlayer,
              isWall: isWall,
              keyItem: keyItem,
              door: door,
            ),
          );
        },
      ),
    );
  }

  Widget? _buildCellContent({
    required bool isPlayer,
    required bool isWall,
    required KeyItem? keyItem,
    required Door? door,
  }) {

    // Player has highest priority.
    if (isPlayer) {
      return const Text(
        '🧙',
        style: TextStyle(fontSize: 28),
      );
    }

    // Wall
    if (isWall) {
      return const Text(
        '🧱',
        style: TextStyle(fontSize: 20),
      );
    }

    // Door
    if (door != null && !door.isOpen) {
      return Text(
        _getDoorEmoji(door.color),
        style: const TextStyle(fontSize: 22),
      );
    }

    // Key
    if (keyItem != null) {
      return Text(
        _getKeyEmoji(keyItem.color),
        style: const TextStyle(fontSize: 22),
      );
    }

    return null;
  }

  String _getKeyEmoji(KeyColor color) {
    switch (color) {
      case KeyColor.red:
        return '🔴';

      case KeyColor.blue:
        return '🔵';

      case KeyColor.yellow:
        return '🟡';
    }
  }

  String _getDoorEmoji(KeyColor color) {
    switch (color) {
      case KeyColor.red:
        return '🟥';

      case KeyColor.blue:
        return '🚪';

      case KeyColor.yellow:
        return '🟨';
    }
  }
}