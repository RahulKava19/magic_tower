import 'package:flutter/material.dart';

import '../game/game_map.dart';
import '../models/door.dart';
import '../models/key.dart';
import '../models/monster.dart';
import '../models/player.dart';
import 'door_widget.dart';
import 'key_widget.dart';

class GameBoard extends StatelessWidget {
  final Player player;
  final int currentFloor;

  const GameBoard({
    super.key,
    required this.player,
    required this.currentFloor,
  });

  @override
  Widget build(BuildContext context) {
    const int rows = 10;
    const int columns = 10;

    return LayoutBuilder(
      builder: (context, constraints) {
        final double availableWidth =
            constraints.maxWidth;

        final double boardWidth =
        availableWidth > 620
            ? 620
            : availableWidth;

        final double boardHeight =
            boardWidth;

        return Center(
          child: SizedBox(
            width: boardWidth,
            height: boardHeight,
            child: Container(
              padding:
              const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color:
                const Color(0xFF171717),
                borderRadius:
                BorderRadius.circular(14),
                border: Border.all(
                  color:
                  const Color(0xFFD5A84B),
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color:
                    Colors.black.withValues(
                      alpha: 0.5,
                    ),
                    blurRadius: 18,
                    offset:
                    const Offset(0, 7),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius:
                BorderRadius.circular(10),
                child: GridView.builder(
                  physics:
                  const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 10,
                    childAspectRatio: 1,
                  ),
                  itemCount: 100,
                  itemBuilder:
                      (context, index) {
                    final int row =
                        index ~/ 10;

                    final int column =
                        index % 10;

                    return _buildTile(
                      row,
                      column,
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // ============================================================
  // TILE
  // ============================================================

  Widget _buildTile(
      int row,
      int column,
      ) {
    final TileType tile =
    GameMap.getTile(
      currentFloor,
      row,
      column,
    );

    final bool isPlayer =
        player.row == row &&
            player.column == column;

    final KeyItem? key =
    currentFloor == 1
        ? GameMap.getKeyAt(
      row,
      column,
    )
        : null;

    final Door? door =
    currentFloor == 1
        ? GameMap.getDoorAt(
      row,
      column,
    )
        : null;

    final Monster? monster =
    currentFloor == 1
        ? GameMap.getMonsterAt(
      row,
      column,
    )
        : null;

    return Container(
      decoration: BoxDecoration(
        color:
        _getTileColor(tile),
        border: Border.all(
          color:
          const Color(0xFF252525),
          width: 0.7,
        ),
      ),
      child: Stack(
        alignment:
        Alignment.center,
        children: [
          // ======================================================
          // GATE
          // ======================================================

          if (tile == TileType.gate)
            _buildGate(),

          // ======================================================
          // DOOR
          // ======================================================

          if (door != null)
            GameDoorWidget(
              color: door.color,
              isOpen: door.isOpen,
            ),

          // ======================================================
          // KEY
          // ======================================================

          if (key != null)
            GameKeyWidget(
              color: key.color,
            ),

          // ======================================================
          // MONSTER
          // ======================================================

          if (monster != null)
            _buildMonster(monster),

          // ======================================================
          // PLAYER
          // ======================================================

          if (isPlayer)
            _buildPlayer(),
        ],
      ),
    );
  }

  // ============================================================
  // PLAYER
  // ============================================================

  Widget _buildPlayer() {
    return Container(
      width: 31,
      height: 31,
      alignment:
      Alignment.center,
      decoration: BoxDecoration(
        color:
        const Color(0xAA111111),
        shape:
        BoxShape.circle,
        border: Border.all(
          color:
          const Color(0xFFFFD166),
          width: 1.5,
        ),
      ),
      child: const Text(
        '🧙',
        style: TextStyle(
          fontSize: 22,
        ),
      ),
    );
  }

  // ============================================================
  // MONSTER
  // ============================================================

  Widget _buildMonster(
      Monster monster,
      ) {
    String icon = '👾';

    if (monster.name
        .toLowerCase()
        .contains('skeleton')) {
      icon = '💀';
    }

    return Text(
      icon,
      style: const TextStyle(
        fontSize: 24,
      ),
    );
  }

  // ============================================================
  // GATE
  // ============================================================

  Widget _buildGate() {
    return Container(
      margin:
      const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color:
        const Color(0xFF5A3823),
        borderRadius:
        BorderRadius.circular(5),
        border: Border.all(
          color:
          const Color(0xFFFFD166),
          width: 2,
        ),
      ),
      child: const Icon(
        Icons.door_front_door,
        color:
        Color(0xFFFFD166),
        size: 26,
      ),
    );
  }

  // ============================================================
  // TILE COLORS
  // ============================================================

  Color _getTileColor(
      TileType tile,
      ) {
    switch (tile) {
      case TileType.wall:
        return const Color(
          0xFF60402E,
        );

      case TileType.floor:
        return const Color(
          0xFF383838,
        );

      case TileType.entrancePath:
        return const Color(
          0xFF81796B,
        );

      case TileType.gate:
        return const Color(
          0xFF30251E,
        );
    }
  }
}