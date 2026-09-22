import 'package:flutter/material.dart';

import '../models/key.dart';

class GameDoorWidget extends StatelessWidget {
  final KeyColor color;
  final bool isOpen;

  const GameDoorWidget({
    super.key,
    required this.color,
    required this.isOpen,
  });

  @override
  Widget build(BuildContext context) {
    final Color doorColor = _getColor();

    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: isOpen
            ? const Color(0xFF3A443E)
            : const Color(0xFF282D33),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: doorColor,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: doorColor.withValues(alpha: 0.35),
            blurRadius: 5,
          ),
        ],
      ),
      child: Center(
        child: Icon(
          isOpen
              ? Icons.lock_open
              : Icons.lock,
          color: isOpen
              ? Colors.white54
              : doorColor,
          size: 24,
        ),
      ),
    );
  }

  Color _getColor() {
    switch (color) {
      case KeyColor.red:
        return const Color(0xFFFF4D4D);

      case KeyColor.blue:
        return const Color(0xFF4D9FFF);

      case KeyColor.yellow:
        return const Color(0xFFFFD43B);
    }
  }
}