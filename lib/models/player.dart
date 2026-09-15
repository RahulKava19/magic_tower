//To store the player data

class Player {
  int row;
  int column;

  int redKeys;
  int blueKeys;
  int yellowKeys;

  Player({
    this.row = 4,
    this.column = 4,
    this.redKeys = 0,
    this.blueKeys = 0,
    this.yellowKeys = 0,
  });
}