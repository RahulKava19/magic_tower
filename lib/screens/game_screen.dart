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
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  // ============================================================
  // PLAYER
  // ============================================================

  final Player player = Player();

  // ============================================================
  // CURRENT FLOOR
  // ============================================================

  int currentFloor = 0;

  // ============================================================
  // INFORMATION PANEL
  // ============================================================

  String selectedObject = 'Entrance';

  String selectedDescription =
      'Follow the central vertical path towards the tower gate.';

  String selectedIcon = '🏰';

  // ============================================================
  // CURRENT MONSTER
  // ============================================================

  Monster? currentMonster;

  // ============================================================
  // MOVE PLAYER
  // ============================================================

  void movePlayer(
      int rowChange,
      int columnChange,
      ) {
    final int newRow = player.row + rowChange;
    final int newColumn = player.column + columnChange;

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

    if (GameMap.isGate(
      currentFloor,
      newRow,
      newColumn,
    )) {
      _handleGate(
        newRow,
        newColumn,
      );

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
        'This is a solid tower wall. You cannot pass through it.',
        '🧱',
      );

      return;
    }

    // ==========================================================
    // DOOR
    // ==========================================================

    final Door? door = currentFloor == 1
        ? GameMap.getDoorAt(
      newRow,
      newColumn,
    )
        : null;

    if (door != null && !door.isOpen) {
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

    final Monster? monster = currentFloor == 1
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

    final KeyItem? key = currentFloor == 1
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
        'Follow the vertical path towards the tower entrance.',
        '⬆️',
      );
    } else {
      _showObjectInfo(
        'Dungeon Floor',
        'You can move through this area.',
        '⬜',
      );
    }
  }

  // ============================================================
  // HANDLE GATE
  // ============================================================

  void _handleGate(
      int row,
      int column,
      ) {
    if (currentFloor == 0) {
      _goToFloorOne();
      return;
    }

    if (currentFloor == 1) {
      if (row == 8 && column == 1) {
        _goToPreviousFloor();
        return;
      }

      if (row == 1 && column == 8) {
        _goToNextFloor();
        return;
      }
    }

    if (currentFloor == 2) {
      _goToPreviousFloor();
    }
  }

  // ============================================================
  // FLOOR 0 -> FLOOR 1
  // ============================================================

  void _goToFloorOne() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            '🏰 Enter Magic Tower',
          ),
          content: const Text(
            'You reached the main entrance.\n\n'
                'The first dungeon floor begins beyond this gate.',
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

                  player.row = 8;
                  player.column = 2;
                });

                _showObjectInfo(
                  'Floor 1',
                  'Explore the dungeon. Find keys, open doors and defeat monsters.',
                  '🏰',
                );
              },
              child: const Text(
                'Enter Floor 1',
              ),
            ),
          ],
        );
      },
    );
  }

  // ============================================================
  // FLOOR 1 -> FLOOR 0
  // ============================================================

  void _goToPreviousFloor() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            '⬇️ Previous Floor',
          ),
          content: const Text(
            'Return to the entrance floor?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();

                setState(() {
                  currentFloor = 0;

                  player.row = 1;
                  player.column = 4;
                });

                _showObjectInfo(
                  'Entrance Floor',
                  'You returned to the entrance of the tower.',
                  '⬇️',
                );
              },
              child: const Text(
                'Go Back',
              ),
            ),
          ],
        );
      },
    );
  }

  // ============================================================
  // FLOOR 1 -> FLOOR 2
  // ============================================================

  void _goToNextFloor() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            '⬆️ Next Floor',
          ),
          content: const Text(
            'You found the staircase to the next floor.\n\n'
                'Floor 2 will be connected here.',
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();

                _showObjectInfo(
                  'Floor 2',
                  'The second floor is ready to be connected.',
                  '⬆️',
                );
              },
              child: const Text(
                'Continue',
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

    final String color = _keyColorName(
      key.color,
    );

    _showObjectInfo(
      '$color Key',
      'You collected the $color key. Find the matching $color door.',
      '🔑',
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '🔑 $color key collected!',
        ),
        duration: const Duration(
          seconds: 1,
        ),
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
        hasKey = player.yellowKeys > 0;
        break;
    }

    final String color = _keyColorName(
      door.color,
    );

    if (!hasKey) {
      _showObjectInfo(
        '$color Door',
        'This door needs a $color key.',
        '🚪',
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '🔒 You need a $color key.',
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
      'You used the matching $color key.',
      '🔓',
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '🔓 $color door opened!',
        ),
        duration: const Duration(
          seconds: 1,
        ),
      ),
    );
  }

  // ============================================================
  // MONSTER DIALOG
  //
  // SHOW:
  // - Monster Health
  // - Monster Attack
  // - Monster Defence
  // - XP Reward
  // - Coin Reward
  //
  // DO NOT SHOW PLAYER ATTACK/DEFENCE HERE.
  // They are already visible in PlayerStatus.
  // ============================================================

  void _showMonsterDialog(
      Monster monster,
      int row,
      int column,
      ) {
    currentMonster = monster;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(
          builder: (
              context,
              dialogSetState,
              ) {
            return AlertDialog(
              title: Row(
                children: [
                  Text(
                    monster.name.toLowerCase().contains(
                      'skeleton',
                    )
                        ? '💀'
                        : '👾',
                    style: const TextStyle(
                      fontSize: 28,
                    ),
                  ),

                  const SizedBox(
                    width: 10,
                  ),

                  Expanded(
                    child: Text(
                      monster.name,
                    ),
                  ),
                ],
              ),

              // ==================================================
              // MONSTER INFORMATION
              // ==================================================

              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ------------------------------------------------
                  // MONSTER ICON
                  // ------------------------------------------------

                  Center(
                    child: Text(
                      monster.name.toLowerCase().contains(
                        'skeleton',
                      )
                          ? '💀'
                          : '👾',
                      style: const TextStyle(
                        fontSize: 55,
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 12,
                  ),

                  // ------------------------------------------------
                  // MONSTER HEALTH
                  // ------------------------------------------------

                  Text(
                    '❤️ Health: ${monster.health}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(
                    height: 6,
                  ),

                  // ------------------------------------------------
                  // MONSTER ATTACK
                  // ------------------------------------------------

                  Text(
                    '⚔️ Attack: ${monster.attack}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(
                    height: 6,
                  ),

                  // ------------------------------------------------
                  // MONSTER DEFENCE
                  // ------------------------------------------------

                  Text(
                    '🛡️ Defence: ${monster.defence}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(
                    height: 6,
                  ),

                  // ------------------------------------------------
                  // XP REWARD
                  // ------------------------------------------------

                  Text(
                    '⭐ XP Reward: ${monster.experienceReward}',
                  ),

                  const SizedBox(
                    height: 6,
                  ),

                  // ------------------------------------------------
                  // COIN REWARD
                  // ------------------------------------------------

                  Text(
                    '🪙 Coin Reward: ${monster.coinReward}',
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  const Text(
                    'Attack the monster. '
                        'If it survives, it will attack you.',
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),

              // ==================================================
              // BUTTONS
              // ==================================================

              actions: [
                // ------------------------------------------------
                // RUN
                // ------------------------------------------------

                TextButton(
                  onPressed: () {
                    currentMonster = null;

                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Run',
                  ),
                ),

                // ------------------------------------------------
                // ATTACK
                // ------------------------------------------------

                ElevatedButton.icon(
                  onPressed: () {
                    final bool defeated =
                    _performAttack(
                      monster,
                    );

                    if (!mounted) {
                      return;
                    }

                    if (defeated ||
                        player.health <= 0) {
                      Navigator.of(context).pop();
                    } else {
                      dialogSetState(() {});
                    }
                  },
                  icon: const Icon(
                    Icons.flash_on,
                  ),
                  label: const Text(
                    'Attack',
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
  // PERFORM ONE ATTACK ROUND
  //
  // PLAYER DAMAGE:
  //
  // Player Attack - Monster Defence
  //
  // MONSTER DAMAGE:
  //
  // Monster Attack - Player Defence
  //
  // Minimum damage = 0
  // ============================================================

  bool _performAttack(
      Monster monster,
      ) {
    // ==========================================================
    // PLAYER ATTACK
    // ==========================================================

    int playerDamage =
        player.attack - monster.defence;

    if (playerDamage < 0) {
      playerDamage = 0;
    }

    // ==========================================================
    // REDUCE MONSTER HEALTH
    // ==========================================================

    monster.health -= playerDamage;

    if (monster.health < 0) {
      monster.health = 0;
    }

    // ==========================================================
    // MONSTER DEFEATED
    // ==========================================================

    if (monster.health <= 0) {
      monster.isDefeated = true;

      player.experience +=
          monster.experienceReward;

      player.coins +=
          monster.coinReward;

      player.row = monster.row;
      player.column = monster.column;

      setState(() {});

      _showObjectInfo(
        'Monster Defeated',
        '${monster.name} defeated!\n'
            '⚔️ Damage dealt: $playerDamage\n'
            '+${monster.experienceReward} XP\n'
            '+${monster.coinReward} coins.',
        '🏆',
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '🏆 ${monster.name} defeated! '
                '+${monster.experienceReward} XP '
                '+${monster.coinReward} coins',
          ),
          duration: const Duration(
            seconds: 2,
          ),
        ),
      );

      currentMonster = null;

      return true;
    }

    // ==========================================================
    // MONSTER COUNTERATTACK
    // ==========================================================

    int monsterDamage =
        monster.attack - player.defence;

    if (monsterDamage < 0) {
      monsterDamage = 0;
    }

    // ==========================================================
    // REDUCE PLAYER HEALTH
    // ==========================================================

    player.health -= monsterDamage;

    if (player.health < 0) {
      player.health = 0;
    }

    setState(() {});

    // ==========================================================
    // PLAYER DEFEATED
    // ==========================================================

    if (player.health <= 0) {
      currentMonster = null;

      return false;
    }

    // ==========================================================
    // COMBAT INFORMATION
    // ==========================================================

    _showObjectInfo(
      'Combat',
      '${monster.name}\n'
          '⚔️ You dealt $playerDamage damage.\n'
          '⚔️ Monster dealt $monsterDamage damage.',
      '⚔️',
    );

    return false;
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
                Navigator.of(context).pop();

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
  // RESET GAME
  // ============================================================

  void _resetGame() {
    setState(() {
      currentFloor = 0;

      player.row = 9;
      player.column = 4;

      player.health = 2000;
      player.attack = 300;
      player.defence = 150;

      player.experience = 0;
      player.coins = 0;

      player.redKeys = 0;
      player.blueKeys = 0;
      player.yellowKeys = 0;

      // --------------------------------------------------------
      // RESET KEYS
      // --------------------------------------------------------

      for (final key in GameMap.floor1Keys) {
        key.isCollected = false;
      }

      // --------------------------------------------------------
      // RESET DOORS
      // --------------------------------------------------------

      for (final door in GameMap.floor1Doors) {
        door.isOpen = false;
      }

      // --------------------------------------------------------
      // RESET MONSTERS
      // --------------------------------------------------------

      for (final monster in GameMap.floor1Monsters) {
        monster.isDefeated = false;

        if (monster.name
            .toLowerCase()
            .contains('skeleton')) {
          monster.health = 700;
        } else {
          monster.health = 500;
        }
      }
    });

    _showObjectInfo(
      'Entrance',
      'Follow the central vertical path towards the Magic Tower.',
      '🏰',
    );
  }

  // ============================================================
  // INFORMATION PANEL UPDATE
  // ============================================================

  void _showObjectInfo(
      String title,
      String description,
      String icon,
      ) {
    setState(() {
      selectedObject = title;
      selectedDescription = description;
      selectedIcon = icon;
    });
  }

  // ============================================================
  // BUILD SCREEN
  // ============================================================

  @override
  Widget build(
      BuildContext context,
      ) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0C12),

      body: SafeArea(
        child: LayoutBuilder(
          builder: (
              context,
              constraints,
              ) {
            final bool desktop =
                constraints.maxWidth >= 950;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(12),

              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 1200,
                  ),

                  child: Column(
                    children: [
                      // ==================================================
                      // PLAYER STATUS
                      // ==================================================

                      PlayerStatus(
                        player: player,
                        currentFloor: currentFloor,
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
                          CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 7,
                              child: Column(
                                children: [
                                  GameBoard(
                                    player: player,
                                    currentFloor: currentFloor,
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
                              child: _buildInfoPanel(),
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
                              currentFloor: currentFloor,
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

      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: const Color(0xFF101C27),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFF49657A),
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          const Text(
            'Tile Information',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
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
                alignment: Alignment.center,

                decoration: BoxDecoration(
                  color: const Color(0xFF263746),
                  borderRadius: BorderRadius.circular(9),
                ),

                child: Text(
                  selectedIcon,
                  style: const TextStyle(
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
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(
                      height: 3,
                    ),

                    Text(
                      selectedDescription,
                      style: const TextStyle(
                        color: Colors.white70,
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
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(
            height: 6,
          ),

          const Text(
            '🔑 Collect keys before attempting their doors.\n'
                '🚪 Matching keys open matching doors.\n'
                '⚔️ Attack monsters during combat.\n'
                '🛡️ Defence reduces incoming damage.\n'
                '⭐ Defeated monsters give XP.\n'
                '🪙 Defeated monsters give coins.\n'
                '⬇️ Use the lower gate to return to the previous floor.\n'
                '⬆️ Use the upper gate to continue to the next floor.\n'
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
      padding: const EdgeInsets.all(8),

      decoration: BoxDecoration(
        color: const Color(0xFF10151D),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFF26384A),
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
            mainAxisAlignment: MainAxisAlignment.center,
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

        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF172638),
          foregroundColor: Colors.white,
          padding: EdgeInsets.zero,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),

            side: const BorderSide(
              color: Color(0xFF59799D),
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
  // KEY COLOR NAME
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