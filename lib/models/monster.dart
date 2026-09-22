class Monster {
  final int row;
  final int column;

  final String name;

  int health;
  final int maxHealth;

  final int attackPower;
  final int experienceReward;
  final int coinReward;

  bool isDefeated;

  Monster({
    required this.row,
    required this.column,
    required this.name,
    required this.health,
    required this.attackPower,
    required this.experienceReward,
    required this.coinReward,
    this.isDefeated = false,
  }) : maxHealth = health;
}