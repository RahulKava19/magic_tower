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
  // MAP SIZE
  // ============================================================

  static const int rows = 10;

  static const int columns = 10;

  // ============================================================
  // ENTRANCE MAP
  // ============================================================

  static const List<List<TileType>> entranceMap = [
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
      TileType.wall,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.gate,
      TileType.wall,
    ],
    [
      TileType.wall,
      TileType.floor,
      TileType.wall,
      TileType.wall,
      TileType.floor,
      TileType.wall,
      TileType.wall,
      TileType.wall,
      TileType.floor,
      TileType.wall,
    ],
    [
      TileType.wall,
      TileType.floor,
      TileType.floor,
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
      TileType.wall,
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
      TileType.floor,
      TileType.wall,
      TileType.floor,
      TileType.floor,
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
      TileType.gate,
      TileType.floor,
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
      column: 5,
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
  // ============================================================

  static final List<Door> floor1Doors = [
    Door(
      row: 5,
      column: 2,
      color: KeyColor.red,
    ),

    Door(
      row: 6,
      column: 7,
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
  //
  // Each monster now has:
  //
  // Health
  // Attack
  // Defence
  // XP
  // Coins
  // ============================================================

  static final List<Monster> floor1Monsters = [
    Monster(
      row: 3,
      column: 7,
      name: 'Green Slime',

      health: 500,

      attack: 100,

      defence: 50,

      experienceReward: 100,

      coinReward: 20,
    ),

    Monster(
      row: 5,
      column: 8,
      name: 'Skeleton',

      health: 700,

      attack: 150,

      defence: 100,

      experienceReward: 150,

      coinReward: 30,
    ),

    Monster(
      row: 7,
      column: 1,
      name: 'Red Slime',

      health: 500,

      attack: 120,

      defence: 60,

      experienceReward: 100,

      coinReward: 25,
    ),

    Monster(
      row: 8,
      column: 5,
      name: 'Skeleton',

      health: 700,

      attack: 150,

      defence: 100,

      experienceReward: 150,

      coinReward: 30,
    ),
  ];

  // ============================================================
  // FLOOR SIZE
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
  // GET KEY
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
  // GET DOOR
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
  // GET MONSTER
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