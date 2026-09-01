import 'package:flutter/material.dart';

import 'screens/game_screen.dart';

void main() {
  runApp(const MagicTowerApp());
}

class MagicTowerApp extends StatelessWidget {
  const MagicTowerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Magic Tower',
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const GameScreen(),
    );
  }
}