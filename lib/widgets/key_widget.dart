import 'package:flutter/material.dart';

import '../models/key.dart';

class GameKeyWidget extends StatelessWidget {
  final KeyColor color;

  const GameKeyWidget({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final Color keyColor = _getColor();

    return Container(
      width: 34,
      height: 34,
      decoration: BoxDecoration(
        color: keyColor.withValues(alpha: 0.18),
        shape: BoxShape.circle,
        border: Border.all(
          color: keyColor,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: keyColor.withValues(alpha: 0.35),
            blurRadius: 6,
          ),
        ],
      ),
      child: Icon(
        Icons.key,
        color: keyColor,
        size: 23,
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