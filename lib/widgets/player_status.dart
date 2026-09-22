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
      width: double.infinity,
      padding: const EdgeInsets.all(12),
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
          // ======================================================
          // FLOOR
          // ======================================================

          Row(
            children: [
              const Text(
                '🏰',
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                _floorName(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // ======================================================
          // PLAYER STATS
          // ======================================================

          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _statBox(
                icon: '❤️',
                title: 'Health',
                value: '${player.health}',
              ),

              _statBox(
                icon: '⚔️',
                title: 'Attack',
                value: '${player.attack}',
              ),

              _statBox(
                icon: '🛡️',
                title: 'Defence',
                value: '${player.defence}',
              ),

              _statBox(
                icon: '⭐',
                title: 'XP',
                value: '${player.experience}',
              ),

              _statBox(
                icon: '🪙',
                title: 'Coins',
                value: '${player.coins}',
              ),
            ],
          ),

          const SizedBox(height: 10),

          // ======================================================
          // KEYS
          // ======================================================

          Row(
            children: [
              _keyInfo(
                '🔴',
                player.redKeys,
              ),

              const SizedBox(width: 12),

              _keyInfo(
                '🔵',
                player.blueKeys,
              ),

              const SizedBox(width: 12),

              _keyInfo(
                '🟡',
                player.yellowKeys,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ============================================================
  // STAT BOX
  // ============================================================

  Widget _statBox({
    required String icon,
    required String title,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF172638),
        borderRadius: BorderRadius.circular(9),
        border: Border.all(
          color: const Color(0xFF30485E),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            icon,
            style: const TextStyle(
              fontSize: 17,
            ),
          ),

          const SizedBox(width: 5),

          Text(
            '$title: ',
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
          ),

          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // KEY INFO
  // ============================================================

  Widget _keyInfo(
      String icon,
      int count,
      ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          icon,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),

        const SizedBox(width: 4),

        Text(
          '$count',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // FLOOR NAME
  // ============================================================

  String _floorName() {
    switch (currentFloor) {
      case 0:
        return 'Entrance Floor';

      case 1:
        return 'Floor 1';

      case 2:
        return 'Floor 2';

      default:
        return 'Magic Tower';
    }
  }
}