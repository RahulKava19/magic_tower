import 'package:flutter/material.dart';

class PalaceWidget extends StatelessWidget {
  final bool isMainEntrance;

  const PalaceWidget({
    super.key,
    this.isMainEntrance = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFE7C27D),
            Color(0xFF9C6B3F),
          ],
        ),
        border: Border.all(
          color: const Color(0xFFFFD166),
          width: 1.2,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Palace building.
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '🏰',
                style: TextStyle(
                  fontSize: 34,
                ),
              ),

              if (isMainEntrance)
                Container(
                  margin: const EdgeInsets.only(top: 1),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 1,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(
                      alpha: 0.65,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'ENTER',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 7,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),

          // Small glow around the entrance.
          if (isMainEntrance)
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: const Color(0xFFFFD166),
                  width: 1.5,
                ),
              ),
            ),
        ],
      ),
    );
  }
}