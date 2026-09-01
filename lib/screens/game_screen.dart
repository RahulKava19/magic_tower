import 'package:flutter/material.dart';

import '../models/player.dart';
import '../widgets/game_board.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final Player player = Player();

  void movePlayer(int rowChange, int columnChange) {
    setState(() {
      player.row += rowChange;
      player.column += columnChange;
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
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: GameBoard(
                  player: player,
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