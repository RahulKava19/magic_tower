class Monster {
  // ============================================================
  // POSITION
  // ============================================================

  int row;

  int column;

  // ============================================================
  // BASIC INFORMATION
  // ============================================================

  String name;

  // ============================================================
  // COMBAT
  // ============================================================

  int health;

  int attack;

  int defence;

  // ============================================================
  // REWARDS
  // ============================================================

  int experienceReward;

  int coinReward;

  // ============================================================
  // STATUS
  // ============================================================

  bool isDefeated;

  // ============================================================
  // CONSTRUCTOR
  // ============================================================

  Monster({
    required this.row,
    required this.column,
    required this.name,
    required this.health,
    required this.attack,
    required this.defence,
    required this.experienceReward,
    required this.coinReward,
    this.isDefeated = false,
  });
}