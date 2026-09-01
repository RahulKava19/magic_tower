import 'package:flutter/material.dart';

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
          crossAxisCount: 10,
        ),
        itemCount: 100,
        itemBuilder: (context, index) {
          final int row = index ~/ 10;
          final int column = index % 10;

          final bool isPlayer =
              row == player.row && column == player.column;

          return Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
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
                : null,
          );
        },
      ),
    );
  }
}