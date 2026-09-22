import 'package:flutter/material.dart';

import '../game/game_map.dart';
import '../models/door.dart';
import '../models/key.dart';
import '../models/monster.dart';
import '../models/player.dart';
import '../widgets/game_board.dart';
import '../widgets/player_status.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({
    super.key,
  });

  @override
  State<GameScreen> createState() =>
      _GameScreenState();
}

class _GameScreenState
    extends State<GameScreen> {
  // ============================================================
  // PLAYER
  // ============================================================

  final Player player = Player();

  // ============================================================
  // CURRENT FLOOR
  //
  // 0 = Entrance
  // 1 = First dungeon floor
  // ============================================================

  int currentFloor = 0;

  // ============================================================
  // SELECTED INFORMATION
  // ============================================================

  String selectedObject = 'Entrance';

  String selectedDescription =
      'You are at the entrance of the Magic Tower. '
      'Follow the central path to the gate.';

  String selectedIcon = '🏰';

  // ============================================================
  // MOVE PLAYER
  // ============================================================

  void movePlayer(
      int rowChange,
      int columnChange,
      ) {
    final int newRow =
        player.row + rowChange;

    final int newColumn =
        player.column + columnChange;

    // ==========================================================
    // MAP BOUNDARY
    // ==========================================================

    if (newRow < 0 ||
        newRow >= GameMap.rows ||
        newColumn < 0 ||
        newColumn >= GameMap.columns) {
      return;
    }

    // ==========================================================
    // GATE
    // ==========================================================

    if (currentFloor == 0 &&
        GameMap.isGate(
          currentFloor,
          newRow,
          newColumn,
        )) {
      _enterFloorOne();
      return;
    }

    // ==========================================================
    // WALL
    // ==========================================================

    if (GameMap.isWall(
      currentFloor,
      newRow,
      newColumn,
    )) {
      _showObjectInfo(
        'Wall',
        'A solid wall. '
            'You cannot pass through it.',
        '🧱',
      );

      return;
    }

    // ==========================================================
    // DOOR
    // ==========================================================

    final Door? door =
    currentFloor == 1
        ? GameMap.getDoorAt(
      newRow,
      newColumn,
    )
        : null;

    if (door != null &&
        !door.isOpen) {
      _tryOpenDoor(
        door,
        newRow,
        newColumn,
      );

      return;
    }

    // ==========================================================
    // MONSTER
    // ==========================================================

    final Monster? monster =
    currentFloor == 1
        ? GameMap.getMonsterAt(
      newRow,
      newColumn,
    )
        : null;

    if (monster != null) {
      _showMonsterDialog(
        monster,
        newRow,
        newColumn,
      );

      return;
    }

    // ==========================================================
    // KEY
    // ==========================================================

    final KeyItem? key =
    currentFloor == 1
        ? GameMap.getKeyAt(
      newRow,
      newColumn,
    )
        : null;

    if (key != null) {
      _collectKey(
        key,
        newRow,
        newColumn,
      );

      return;
    }

    // ==========================================================
    // NORMAL MOVEMENT
    // ==========================================================

    setState(() {
      player.row = newRow;
      player.column = newColumn;
    });

    if (currentFloor == 0) {
      _showObjectInfo(
        'Entrance Path',
        'Follow this vertical path toward the '
            'Magic Tower entrance.',
        '⬆️',
      );
    } else {
      _showObjectInfo(
        'Dungeon Floor',
        'This area is safe to walk through.',
        '⬜',
      );
    }
  }

  // ============================================================
  // ENTER FLOOR 1
  // ============================================================

  void _enterFloorOne() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            '🏰 Magic Tower',
          ),
          content: const Text(
            'You reached the entrance gate.\n\n'
                'Beyond this gate is the first '
                'dungeon floor.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Stay',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();

                setState(() {
                  currentFloor = 1;

                  // Starting position of Floor 1
                  player.row = 8;
                  player.column = 1;
                });

                _showObjectInfo(
                  'Floor 1',
                  'The first dungeon floor. '
                      'Find keys, unlock matching doors '
                      'and defeat monsters.',
                  '🏰',
                );
              },
              child: const Text(
                'Enter Tower',
              ),
            ),
          ],
        );
      },
    );
  }

  // ============================================================
  // COLLECT KEY
  // ============================================================

  void _collectKey(
      KeyItem key,
      int row,
      int column,
      ) {
    setState(() {
      key.isCollected = true;

      player.row = row;
      player.column = column;

      switch (key.color) {
        case KeyColor.red:
          player.redKeys++;
          break;

        case KeyColor.blue:
          player.blueKeys++;
          break;

        case KeyColor.yellow:
          player.yellowKeys++;
          break;
      }
    });

    final String color =
    _keyColorName(key.color);

    _showObjectInfo(
      '$color Key',
      'You collected the $color key. '
          'Find the matching door.',
      '🔑',
    );

    ScaffoldMessenger.of(context)
        .showSnackBar(
      SnackBar(
        content: Text(
          '$color key collected!',
        ),
        duration:
        const Duration(seconds: 1),
      ),
    );
  }

  // ============================================================
  // OPEN DOOR
  // ============================================================

  void _tryOpenDoor(
      Door door,
      int row,
      int column,
      ) {
    bool hasKey = false;

    switch (door.color) {
      case KeyColor.red:
        hasKey = player.redKeys > 0;
        break;

      case KeyColor.blue:
        hasKey = player.blueKeys > 0;
        break;

      case KeyColor.yellow:
        hasKey =
            player.yellowKeys > 0;
        break;
    }

    final String color =
    _keyColorName(door.color);

    if (!hasKey) {
      _showObjectInfo(
        '$color Door',
        'This door requires a $color key.',
        '🚪',
      );

      ScaffoldMessenger.of(context)
          .showSnackBar(
        SnackBar(
          content: Text(
            'You need a $color key.',
          ),
        ),
      );

      return;
    }

    setState(() {
      door.isOpen = true;

      switch (door.color) {
        case KeyColor.red:
          player.redKeys--;
          break;

        case KeyColor.blue:
          player.blueKeys--;
          break;

        case KeyColor.yellow:
          player.yellowKeys--;
          break;
      }

      player.row = row;
      player.column = column;
    });

    _showObjectInfo(
      'Door Opened',
      'The matching $color key opened this door.',
      '🔓',
    );
  }

  // ============================================================
  // MONSTER DIALOG
  // ============================================================

  void _showMonsterDialog(
      Monster monster,
      int row,
      int column,
      ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            '👾 ${monster.name}',
          ),
          content: Text(
            'Health: ${monster.health}\n'
                'Attack: ${monster.attackPower}\n\n'
                'Defeat this monster to continue.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pop();
              },
              child: const Text(
                'Cancel',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pop();

                _fightMonster(
                  monster,
                  row,
                  column,
                );
              },
              child: const Text(
                '⚔️ Fight',
              ),
            ),
          ],
        );
      },
    );
  }

  // ============================================================
  // FIGHT
  // ============================================================

  void _fightMonster(
      Monster monster,
      int row,
      int column,
      ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(
          builder: (
              context,
              setBattleState,
              ) {
            return AlertDialog(
              title: Text(
                '⚔️ ${monster.name}',
              ),
              content: Column(
                mainAxisSize:
                MainAxisSize.min,
                children: [
                  Text(
                    '👾 Monster HP: '
                        '${monster.health}',
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    '🧙 Player HP: '
                        '${player.health}',
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    const int playerAttack =
                    200;

                    monster.health -=
                        playerAttack;

                    // ==================================================
                    // MONSTER DEFEATED
                    // ==================================================

                    if (monster.health <=
                        0) {
                      monster.health = 0;

                      monster.isDefeated =
                      true;

                      player.experience +=
                          monster
                              .experienceReward;

                      player.coins +=
                          monster.coinReward;

                      player.row = row;
                      player.column = column;

                      Navigator.of(
                        context,
                      ).pop();

                      setState(() {});

                      _showObjectInfo(
                        'Monster Defeated',
                        'You defeated ${monster.name}. '
                            '+${monster.experienceReward} XP '
                            '+${monster.coinReward} coins.',
                        '🏆',
                      );

                      return;
                    }

                    // ==================================================
                    // MONSTER ATTACKS
                    // ==================================================

                    player.health -=
                        monster.attackPower;

                    if (player.health <=
                        0) {
                      player.health = 0;

                      Navigator.of(
                        context,
                      ).pop();

                      setState(() {});

                      _showGameOver();

                      return;
                    }

                    setBattleState(() {});
                    setState(() {});
                  },
                  child: const Text(
                    '⚔️ ATTACK',
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  // ============================================================
  // GAME OVER
  // ============================================================

  void _showGameOver() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            '💀 Game Over',
          ),
          content: const Text(
            'Your health reached zero.',
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pop();

                _resetGame();
              },
              child: const Text(
                '🔄 Restart',
              ),
            ),
          ],
        );
      },
    );
  }

  // ============================================================
  // RESET
  // ============================================================

  void _resetGame() {
    setState(() {
      currentFloor = 0;

      player.row = 9;
      player.column = 4;

      player.health = 2000;
      player.experience = 0;
      player.coins = 0;

      player.redKeys = 0;
      player.blueKeys = 0;
      player.yellowKeys = 0;

      for (final key
      in GameMap.floor1Keys) {
        key.isCollected = false;
      }

      for (final door
      in GameMap.floor1Doors) {
        door.isOpen = false;
      }

      for (final monster
      in GameMap.floor1Monsters) {
        monster.isDefeated = false;
      }
    });

    _showObjectInfo(
      'Entrance',
      'Follow the central vertical path to the gate.',
      '🏰',
    );
  }

  // ============================================================
  // INFORMATION
  // ============================================================

  void _showObjectInfo(
      String title,
      String description,
      String icon,
      ) {
    setState(() {
      selectedObject = title;
      selectedDescription =
          description;
      selectedIcon = icon;
    });
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(
      BuildContext context,
      ) {
    return Scaffold(
      backgroundColor:
      const Color(0xFF0E0C12),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (
              context,
              constraints,
              ) {
            final bool desktop =
                constraints.maxWidth >= 950;

            return SingleChildScrollView(
              padding:
              const EdgeInsets.all(12),
              child: Center(
                child: ConstrainedBox(
                  constraints:
                  const BoxConstraints(
                    maxWidth: 1200,
                  ),
                  child: Column(
                    children: [
                      // ==================================================
                      // STATUS
                      // ==================================================

                      PlayerStatus(
                        player: player,
                        currentFloor:
                        currentFloor,
                      ),

                      const SizedBox(
                        height: 14,
                      ),

                      // ==================================================
                      // DESKTOP
                      // ==================================================

                      if (desktop)
                        Row(
                          crossAxisAlignment:
                          CrossAxisAlignment
                              .start,
                          children: [
                            Expanded(
                              flex: 7,
                              child: Column(
                                children: [
                                  GameBoard(
                                    player: player,
                                    currentFloor:
                                    currentFloor,
                                  ),

                                  const SizedBox(
                                    height: 14,
                                  ),

                                  _buildControls(),
                                ],
                              ),
                            ),

                            const SizedBox(
                              width: 18,
                            ),

                            Expanded(
                              flex: 3,
                              child:
                              _buildInfoPanel(),
                            ),
                          ],
                        )

                      // ==================================================
                      // MOBILE
                      // ==================================================

                      else
                        Column(
                          children: [
                            GameBoard(
                              player: player,
                              currentFloor:
                              currentFloor,
                            ),

                            const SizedBox(
                              height: 12,
                            ),

                            _buildControls(),

                            const SizedBox(
                              height: 12,
                            ),

                            _buildInfoPanel(),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // ============================================================
  // INFORMATION PANEL
  // ============================================================

  Widget _buildInfoPanel() {
    return Container(
      width: double.infinity,
      padding:
      const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color:
        const Color(0xFF101C27),
        borderRadius:
        BorderRadius.circular(14),
        border: Border.all(
          color:
          const Color(0xFF49657A),
        ),
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          const Text(
            'Tile Information',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight:
              FontWeight.bold,
            ),
          ),

          const SizedBox(
            height: 10,
          ),

          Row(
            children: [
              Container(
                width: 46,
                height: 46,
                alignment:
                Alignment.center,
                decoration: BoxDecoration(
                  color:
                  const Color(0xFF263746),
                  borderRadius:
                  BorderRadius.circular(9),
                ),
                child: Text(
                  selectedIcon,
                  style:
                  const TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),

              const SizedBox(
                width: 10,
              ),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Text(
                      selectedObject,
                      style:
                      const TextStyle(
                        color:
                        Colors.white,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),

                    const SizedBox(
                      height: 3,
                    ),

                    Text(
                      selectedDescription,
                      style:
                      const TextStyle(
                        color:
                        Colors.white70,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(
            height: 12,
          ),

          const Text(
            'How to Play',
            style: TextStyle(
              color: Colors.white,
              fontWeight:
              FontWeight.bold,
            ),
          ),

          const SizedBox(
            height: 6,
          ),

          const Text(
            '🔑 Collect keys and use them on matching doors.\n'
                '👾 Defeat monsters to earn XP and coins.\n'
                '🚪 Reach the entrance gate to enter the tower.\n'
                '🧱 Walls cannot be crossed.',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 11,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // MOVEMENT CONTROLS
  // ============================================================

  Widget _buildControls() {
    return Container(
      padding:
      const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color:
        const Color(0xFF10151D),
        borderRadius:
        BorderRadius.circular(14),
        border: Border.all(
          color:
          const Color(0xFF26384A),
        ),
      ),
      child: Column(
        children: [
          _movementButton(
            Icons.keyboard_arrow_up,
                () => movePlayer(-1, 0),
          ),

          const SizedBox(
            height: 5,
          ),

          Row(
            mainAxisAlignment:
            MainAxisAlignment.center,
            children: [
              _movementButton(
                Icons.keyboard_arrow_left,
                    () => movePlayer(0, -1),
              ),

              const SizedBox(
                width: 5,
              ),

              _movementButton(
                Icons.keyboard_arrow_down,
                    () => movePlayer(1, 0),
              ),

              const SizedBox(
                width: 5,
              ),

              _movementButton(
                Icons.keyboard_arrow_right,
                    () => movePlayer(0, 1),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ============================================================
  // MOVEMENT BUTTON
  // ============================================================

  Widget _movementButton(
      IconData icon,
      VoidCallback onPressed,
      ) {
    return SizedBox(
      width: 58,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style:
        ElevatedButton.styleFrom(
          backgroundColor:
          const Color(0xFF172638),
          foregroundColor:
          Colors.white,
          padding: EdgeInsets.zero,
          shape:
          RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(10),
            side:
            const BorderSide(
              color:
              Color(0xFF59799D),
            ),
          ),
        ),
        child: Icon(
          icon,
          size: 29,
        ),
      ),
    );
  }

  // ============================================================
  // KEY COLOR
  // ============================================================

  String _keyColorName(
      KeyColor color,
      ) {
    switch (color) {
      case KeyColor.red:
        return 'red';

      case KeyColor.blue:
        return 'blue';

      case KeyColor.yellow:
        return 'yellow';
    }
  }
}