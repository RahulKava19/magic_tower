//To control the game

import 'package:flutter/material.dart';
import '../game/game_map.dart';
import '../models/player.dart';
import '../models/door.dart';
import '../models/key.dart';
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