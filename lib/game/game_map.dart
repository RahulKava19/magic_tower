import '../models/door.dart';
import '../models/key.dart';
import '../models/monster.dart';

enum TileType {
  wall,
  floor,
  entrancePath,
  gate,
}

class GameMap {
  // ============================================================
  // COMMON SIZE
  // ============================================================

  static const int rows = 10;
  static const int columns = 10;

  // ============================================================
  // STARTING FLOOR
  //
  // 10 x 10 grid
  //
  // CENTRAL VERTICAL 2 x 10 PATH
  //
  // Columns 4 and 5 are the entrance path.
  //
  // Player starts at row 9, column 4.
  //
  // Gate is at row 0, column 4.
  // ============================================================

  static const List<List<TileType>> entranceMap = [
    // ==========================================================
    // ROW 0
    // ==========================================================
    [
      TileType.wall,
      TileType.wall,
      TileType.wall,
      TileType.wall,
      TileType.gate,
      TileType.entrancePath,
      TileType.wall,
      TileType.wall,
      TileType.wall,
      TileType.wall,
    ],

    // ==========================================================
    // ROW 1
    // ==========================================================
    [
      TileType.wall,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.entrancePath,
      TileType.entrancePath,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.wall,
    ],

    // ==========================================================
    // ROW 2
    // ==========================================================
    [
      TileType.wall,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.entrancePath,
      TileType.entrancePath,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.wall,
    ],

    // ==========================================================
    // ROW 3
    // ==========================================================
    [
      TileType.wall,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.entrancePath,
      TileType.entrancePath,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.wall,
    ],

    // ==========================================================
    // ROW 4
    // ==========================================================
    [
      TileType.wall,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.entrancePath,
      TileType.entrancePath,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.wall,
    ],

    // ==========================================================
    // ROW 5
    // ==========================================================
    [
      TileType.wall,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.entrancePath,
      TileType.entrancePath,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.wall,
    ],

    // ==========================================================
    // ROW 6
    // ==========================================================
    [
      TileType.wall,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.entrancePath,
      TileType.entrancePath,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.wall,
    ],

    // ==========================================================
    // ROW 7
    // ==========================================================
    [
      TileType.wall,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.entrancePath,
      TileType.entrancePath,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.wall,
    ],

    // ==========================================================
    // ROW 8
    // ==========================================================
    [
      TileType.wall,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.entrancePath,
      TileType.entrancePath,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.wall,
    ],

    // ==========================================================
    // ROW 9
    //
    // PLAYER STARTS HERE
    // ==========================================================
    [
      TileType.wall,
      TileType.wall,
      TileType.wall,
      TileType.wall,
      TileType.entrancePath,
      TileType.entrancePath,
      TileType.wall,
      TileType.wall,
      TileType.wall,
      TileType.wall,
    ],
  ];

  // ============================================================
  // FLOOR 1
  //
  // 10 x 10 dungeon maze
  //
  // NO GREENERY.
  // ============================================================

  static const List<List<TileType>> floor1 = [
    [
      TileType.wall,
      TileType.wall,
      TileType.wall,
      TileType.wall,
      TileType.wall,
      TileType.wall,
      TileType.wall,
      TileType.wall,
      TileType.wall,
      TileType.wall,
    ],

    [
      TileType.wall,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.wall,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.wall,
    ],

    [
      TileType.wall,
      TileType.floor,
      TileType.wall,
      TileType.floor,
      TileType.wall,
      TileType.floor,
      TileType.wall,
      TileType.wall,
      TileType.floor,
      TileType.wall,
    ],

    [
      TileType.wall,
      TileType.floor,
      TileType.wall,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.wall,
    ],

    [
      TileType.wall,
      TileType.floor,
      TileType.wall,
      TileType.wall,
      TileType.wall,
      TileType.floor,
      TileType.wall,
      TileType.floor,
      TileType.floor,
      TileType.wall,
    ],

    [
      TileType.wall,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.wall,
      TileType.floor,
      TileType.wall,
      TileType.floor,
      TileType.floor,
      TileType.wall,
    ],

    [
      TileType.wall,
      TileType.wall,
      TileType.wall,
      TileType.floor,
      TileType.wall,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.wall,
      TileType.wall,
    ],

    [
      TileType.wall,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.wall,
      TileType.wall,
      TileType.wall,
      TileType.floor,
      TileType.floor,
      TileType.wall,
    ],

    [
      TileType.wall,
      TileType.floor,
      TileType.wall,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.wall,
    ],

    [
      TileType.wall,
      TileType.wall,
      TileType.wall,
      TileType.wall,
      TileType.wall,
      TileType.wall,
      TileType.wall,
      TileType.wall,
      TileType.wall,
      TileType.wall,
    ],
  ];

  // ============================================================
  // KEYS
  // ============================================================

  static final List<KeyItem> floor1Keys = [
    KeyItem(
      row: 1,
      column: 2,
      color: KeyColor.red,
    ),

    KeyItem(
      row: 1,
      column: 7,
      color: KeyColor.blue,
    ),

    KeyItem(
      row: 5,
      column: 2,
      color: KeyColor.yellow,
    ),

    KeyItem(
      row: 7,
      column: 8,
      color: KeyColor.blue,
    ),
  ];

  // ============================================================
  // DOORS
  //
  // Every door has a matching key.
  // ============================================================

  static final List<Door> floor1Doors = [
    Door(
      row: 3,
      column: 2,
      color: KeyColor.red,
    ),

    Door(
      row: 3,
      column: 6,
      color: KeyColor.blue,
    ),

    Door(
      row: 7,
      column: 3,
      color: KeyColor.yellow,
    ),

    Door(
      row: 8,
      column: 7,
      color: KeyColor.blue,
    ),
  ];

  // ============================================================
  // MONSTERS
  // ============================================================

  static final List<Monster> floor1Monsters = [
    Monster(
      row: 3,
      column: 7,
      name: 'Green Slime',
      health: 500,
      attackPower: 100,
      experienceReward: 100,
      coinReward: 20,
    ),

    Monster(
      row: 5,
      column: 7,
      name: 'Skeleton',
      health: 700,
      attackPower: 150,
      experienceReward: 150,
      coinReward: 30,
    ),

    Monster(
      row: 7,
      column: 1,
      name: 'Red Slime',
      health: 500,
      attackPower: 120,
      experienceReward: 100,
      coinReward: 25,
    ),

    Monster(
      row: 8,
      column: 5,
      name: 'Skeleton',
      health: 700,
      attackPower: 150,
      experienceReward: 150,
      coinReward: 30,
    ),
  ];

  // ============================================================
  // DIMENSIONS
  // ============================================================

  static int rowsForFloor(int floor) {
    return rows;
  }

  static int columnsForFloor(int floor) {
    return columns;
  }

  // ============================================================
  // GET TILE
  // ============================================================

  static TileType getTile(
      int floor,
      int row,
      int column,
      ) {
    if (floor == 0) {
      return entranceMap[row][column];
    }

    return floor1[row][column];
  }

  // ============================================================
  // WALL
  // ============================================================

  static bool isWall(
      int floor,
      int row,
      int column,
      ) {
    return getTile(
      floor,
      row,
      column,
    ) ==
        TileType.wall;
  }

  // ============================================================
  // GATE
  // ============================================================

  static bool isGate(
      int floor,
      int row,
      int column,
      ) {
    return getTile(
      floor,
      row,
      column,
    ) ==
        TileType.gate;
  }

  // ============================================================
  // KEY
  // ============================================================

  static KeyItem? getKeyAt(
      int row,
      int column,
      ) {
    for (final key in floor1Keys) {
      if (key.row == row &&
          key.column == column &&
          !key.isCollected) {
        return key;
      }
    }

    return null;
  }

  // ============================================================
  // DOOR
  // ============================================================

  static Door? getDoorAt(
      int row,
      int column,
      ) {
    for (final door in floor1Doors) {
      if (door.row == row &&
          door.column == column) {
        return door;
      }
    }

    return null;
  }

  // ============================================================
  // MONSTER
  // ============================================================

  static Monster? getMonsterAt(
      int row,
      int column,
      ) {
    for (final monster in floor1Monsters) {
      if (monster.row == row &&
          monster.column == column &&
          !monster.isDefeated) {
        return monster;
      }
    }

    return null;
  }
}