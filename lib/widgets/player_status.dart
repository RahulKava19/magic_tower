// Displays the player's current status

import 'package:flutter/material.dart';
import '../models/player.dart';

class PlayerStatus extends StatelessWidget {
  final Player player;
  final int currentFloor;

  const PlayerStatus({
    super.key,
    required this.player,
    required this.currentFloor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey.shade700,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStat(
                '❤️',
                '${player.health} HP',
              ),
              _buildStat(
                '⭐',
                '${player.experience} XP',
              ),
              _buildStat(
                '🪙',
                '${player.coins}',
              ),
              _buildStat(
                '🏰',
                'Floor $currentFloor',
              ),
            ],
          ),

          const SizedBox(height: 8),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStat(
                '🔴',
                '${player.redKeys}',
              ),
              _buildStat(
                '🔵',
                '${player.blueKeys}',
              ),
              _buildStat(
                '🟡',
                '${player.yellowKeys}',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStat(String icon, String value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          icon,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}