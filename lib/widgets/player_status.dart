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
    const int maxHealth = 2000;

    final double healthProgress =
    (player.health / maxHealth)
        .clamp(0.0, 1.0);

    final String floorText =
    currentFloor == 0
        ? 'ENTRANCE'
        : 'FLOOR $currentFloor';

    return Container(
      padding:
      const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 9,
      ),
      decoration: BoxDecoration(
        gradient:
        const LinearGradient(
          colors: [
            Color(0xFF101C27),
            Color(0xFF0B151F),
          ],
        ),
        borderRadius:
        BorderRadius.circular(14),
        border: Border.all(
          color:
          const Color(0xFF49657A),
        ),
        boxShadow: [
          BoxShadow(
            color:
            Colors.black.withValues(
              alpha: 0.3,
            ),
            blurRadius: 10,
            offset:
            const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // ======================================================
          // HEADER
          // ======================================================

          Row(
            children: [
              const Text(
                '🏰',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),

              const SizedBox(
                width: 7,
              ),

              const Expanded(
                child: Text(
                  'MAGIC TOWER',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight:
                    FontWeight.w900,
                    letterSpacing: 1,
                  ),
                ),
              ),

              Container(
                padding:
                const EdgeInsets.symmetric(
                  horizontal: 9,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color:
                  const Color(0xFF14283D),
                  borderRadius:
                  BorderRadius.circular(7),
                ),
                child: Text(
                  floorText,
                  style: const TextStyle(
                    color:
                    Color(0xFFFFD166),
                    fontSize: 12,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(
            height: 8,
          ),

          // ======================================================
          // HEALTH
          // ======================================================

          Row(
            children: [
              const Text(
                '❤️',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),

              const SizedBox(
                width: 6,
              ),

              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment
                          .spaceBetween,
                      children: [
                        const Text(
                          'HP',
                          style: TextStyle(
                            color:
                            Colors.white70,
                            fontSize: 10,
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${player.health}/$maxHealth',
                          style:
                          const TextStyle(
                            color:
                            Colors.white,
                            fontSize: 10,
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 3,
                    ),

                    ClipRRect(
                      borderRadius:
                      BorderRadius.circular(
                        5,
                      ),
                      child:
                      LinearProgressIndicator(
                        value:
                        healthProgress,
                        minHeight: 7,
                        backgroundColor:
                        const Color(
                          0xFF17222B,
                        ),
                        valueColor:
                        const AlwaysStoppedAnimation<
                            Color>(
                          Color(0xFFE74C3C),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(
            height: 8,
          ),

          // ======================================================
          // XP / COINS / KEYS
          // ======================================================

          Row(
            mainAxisAlignment:
            MainAxisAlignment
                .spaceBetween,
            children: [
              _stat(
                '⭐',
                '${player.experience} XP',
              ),

              _stat(
                '🪙',
                '${player.coins}',
              ),

              _key(
                const Color(0xFFFF4D4D),
                player.redKeys,
              ),

              _key(
                const Color(0xFF4D9FFF),
                player.blueKeys,
              ),

              _key(
                const Color(0xFFFFD43B),
                player.yellowKeys,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ============================================================
  // NORMAL STAT
  // ============================================================

  Widget _stat(
      String icon,
      String text,
      ) {
    return Row(
      mainAxisSize:
      MainAxisSize.min,
      children: [
        Text(
          icon,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 11,
            fontWeight:
            FontWeight.bold,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // KEY
  // ============================================================

  Widget _key(
      Color color,
      int count,
      ) {
    return Row(
      mainAxisSize:
      MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Text(
          '$count',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 11,
            fontWeight:
            FontWeight.bold,
          ),
        ),
      ],
    );
  }
}