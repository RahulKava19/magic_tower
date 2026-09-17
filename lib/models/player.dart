//To store the player data

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
    this.row = 4,
    this.column = 4,
    this.redKeys = 0,
    this.blueKeys = 0,
    this.yellowKeys = 0,
    this.health = 2000,
    this.experience = 0,
    this.coins = 0,
  });
}