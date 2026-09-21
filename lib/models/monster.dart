// To store the monster data

class Monster {
  final int row;
  final int column;

  final String name;

  int health;

  final int experienceReward;
  final int coinReward;

  bool isDefeated;

  Monster({
    required this.row,
    required this.column,
    required this.name,
    required this.health,
    required this.experienceReward,
    required this.coinReward,
    this.isDefeated = false,
  });
}