// Stores the player's data.

class Player {
  int row;
  int column;

  int redKeys;
  int blueKeys;
  int yellowKeys;

  int health;
  int experience;
  int coins;

  Player({
    this.row = 9,
    this.column = 4,
    this.health = 2000,
    this.experience = 0,
    this.coins = 0,
    this.redKeys = 0,
    this.blueKeys = 0,
    this.yellowKeys = 0,
  });
}