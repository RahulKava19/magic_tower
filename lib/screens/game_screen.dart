//To control the game

import 'package:flutter/material.dart';
import '../game/game_map.dart';
import '../models/player.dart';
import '../models/door.dart';
import '../models/key.dart';
import '../models/monster.dart';
import '../widgets/game_board.dart';
import '../widgets/player_status.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final Player player = Player();

  int currentFloor = 1;


  //This will be called from the _movementButton
  void movePlayer(int rowChange, int columnChange) {
    final int newRow = player.row + rowChange;
    final int newColumn = player.column + columnChange;

    // Check board boundaries
    if (newRow < 0 ||
        newRow >= GameMap.rows ||
        newColumn < 0 ||
        newColumn >= GameMap.columns) {
      return;
    }

    // Check wall collision
    if (GameMap.isWall(newRow, newColumn)) {
      return;
    }

    // Check if destination contains a door
    final door = GameMap.getDoorAt(newRow, newColumn);
    if (door != null && !door.isOpen) {
      if (!_unlockDoor(door)) {
        return;
      }
    }

    final Monster? monster = GameMap.getMonsterAt(
      newRow,
      newColumn,
    );

    if (monster != null) {
      _showMonsterEncounter(
        monster,
        newRow,
        newColumn,
      );

      return;
    }

    setState(() {
      player.row = newRow;
      player.column = newColumn;
    });

    collectKey();
  }

  //If the current box is having the key then
  // Increase the count of that color key and change the state of key.
  void collectKey() {
    for (final key in GameMap.floor1Keys) {
      if (key.row == player.row &&
          key.column == player.column &&
          !key.isCollected) {
        setState(() {
          key.isCollected = true;

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

        return;
      }
    }
  }

  // CHeck that same color key is available or not.
  // If key is available then decrease it and remove the door.
  bool _unlockDoor(Door door) {
    switch (door.color) {
      case KeyColor.red:
        if (player.redKeys <= 0) {
          return false;
        }

        player.redKeys--;
        break;

      case KeyColor.blue:
        if (player.blueKeys <= 0) {
          return false;
        }

        player.blueKeys--;
        break;

      case KeyColor.yellow:
        if (player.yellowKeys <= 0) {
          return false;
        }

        player.yellowKeys--;
        break;
    }

    door.isOpen = true;

    return true;
  }

  //To show a card to confirm the fight with the monster
  //Here AlertDialog is used so that the pop will be in small part of the screen and not block whole page
  void _showMonsterEncounter(
      Monster monster,
      int newRow,
      int newColumn,
      ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              const Text(
                '👾',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  monster.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '❤️ Health: ${monster.health}',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                '⭐ XP Reward: ${monster.experienceReward}',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                '🪙 Coin Reward: ${monster.coinReward}',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
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

                _fightMonster(
                  monster,
                  newRow,
                  newColumn,
                );
              },
              child: const Text(
                'Fight',
              ),
            ),
          ],
        );
      },
    );
  }

  //This will be called by the _showMonsterEncounter when we tap on fight button
  void _fightMonster(
      Monster monster,
      int newRow,
      int newColumn,
      ) {
    player.health -= monster.health;

    if (player.health <= 0) {
      player.health = 0;

      // Player dies.
      return;
    }

    // Player survives, so monster is defeated.
    player.experience += monster.experienceReward;
    player.coins += monster.coinReward;

    monster.isDefeated = true;

    setState(() {
      player.row = newRow;
      player.column = newColumn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Magic Tower'),
      ),
      body: Column(
        children: [
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 600, //To make the UI attractive in big screens
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                child: PlayerStatus(
                  player: player,
                  currentFloor: currentFloor,
                ),
              ),
            ),
          ),

          Expanded(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 600,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: GameBoard(
                    player: player,
                  ),
                ),
              ),
            ),
          ),

          _buildMovementControls(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildMovementControls() {
    return Column(
      children: [
        _movementButton(
          Icons.keyboard_arrow_up,
              () => movePlayer(-1, 0),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _movementButton(
              Icons.keyboard_arrow_left,
                  () => movePlayer(0, -1),
            ),
            const SizedBox(width: 8),
            _movementButton(
              Icons.keyboard_arrow_down,
                  () => movePlayer(1, 0),
            ),
            const SizedBox(width: 8),
            _movementButton(
              Icons.keyboard_arrow_right,
                  () => movePlayer(0, 1),
            ),
          ],
        ),
      ],
    );
  }

  Widget _movementButton(
      IconData icon,
      VoidCallback onPressed,
      ) {
    return SizedBox(
      width: 55,
      height: 55,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        child: Icon(
          icon,
          size: 30,
        ),
      ),
    );
  }
}