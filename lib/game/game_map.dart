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
  // ACTIVE FLOOR
  // ============================================================

  static int activeFloor = 0;

  static void setActiveFloor(int floor) {
    activeFloor = floor;
  }

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
  // FLOOR 2 - HARDER DUNGEON
  // ============================================================

  static const List<List<TileType>> floor2 = [
    [
      TileType.wall, TileType.wall, TileType.wall, TileType.wall, TileType.wall,
      TileType.wall, TileType.wall, TileType.wall, TileType.wall, TileType.wall,
    ],
    [
      TileType.wall, TileType.wall, TileType.wall, TileType.floor, TileType.floor,
      TileType.floor, TileType.floor, TileType.floor, TileType.gate, TileType.wall,
    ],
    [
      TileType.wall, TileType.wall, TileType.wall, TileType.floor, TileType.floor,
      TileType.floor, TileType.floor, TileType.floor, TileType.floor, TileType.wall,
    ],
    [
      TileType.wall, TileType.wall, TileType.wall, TileType.wall, TileType.wall,
      TileType.wall, TileType.wall, TileType.floor, TileType.wall, TileType.wall,
    ],
    [
      TileType.wall, TileType.wall, TileType.floor, TileType.floor, TileType.floor,
      TileType.floor, TileType.floor, TileType.floor, TileType.wall, TileType.wall,
    ],
    [
      TileType.wall, TileType.wall, TileType.floor, TileType.wall, TileType.wall,
      TileType.wall, TileType.wall, TileType.wall, TileType.wall, TileType.wall,
    ],
    [
      TileType.wall, TileType.wall, TileType.floor, TileType.floor, TileType.floor,
      TileType.floor, TileType.floor, TileType.floor, TileType.floor, TileType.wall,
    ],
    [
      TileType.wall, TileType.wall, TileType.wall, TileType.wall, TileType.wall,
      TileType.wall, TileType.wall, TileType.wall, TileType.floor, TileType.wall,
    ],
    [
      TileType.wall, TileType.gate, TileType.floor, TileType.floor, TileType.floor,
      TileType.floor, TileType.floor, TileType.floor, TileType.floor, TileType.wall,
    ],
    [
      TileType.wall, TileType.wall, TileType.wall, TileType.wall, TileType.wall,
      TileType.wall, TileType.wall, TileType.wall, TileType.wall, TileType.wall,
    ],
  ];

  // ============================================================
  // FLOOR 2 KEYS
  // ============================================================

  static final List<KeyItem> floor2Keys = [
    KeyItem(row: 8, column: 3, color: KeyColor.red),
    KeyItem(row: 6, column: 3, color: KeyColor.blue),
    KeyItem(row: 4, column: 4, color: KeyColor.yellow),
    KeyItem(row: 2, column: 4, color: KeyColor.red),
    KeyItem(row: 2, column: 5, color: KeyColor.blue),
  ];

  // ============================================================
  // FLOOR 2 DOORS
  // ============================================================

  static final List<Door> floor2Doors = [
    Door(row: 8, column: 5, color: KeyColor.red),
    Door(row: 6, column: 6, color: KeyColor.blue),
    Door(row: 4, column: 7, color: KeyColor.yellow),
    Door(row: 2, column: 7, color: KeyColor.red),
    Door(row: 1, column: 7, color: KeyColor.blue),
  ];

  // ============================================================
  // FLOOR 2 MONSTERS
  // ============================================================

  static final List<Monster> floor2Monsters = [
    Monster(
      row: 8,
      column: 4,
      name: 'Green Slime',
      health: 700,
      attack: 150,
      defence: 80,
      experienceReward: 180,
      coinReward: 35,
    ),
    Monster(
      row: 7,
      column: 8,
      name: 'Red Slime',
      health: 800,
      attack: 200,
      defence: 100,
      experienceReward: 220,
      coinReward: 45,
    ),
    Monster(
      row: 6,
      column: 5,
      name: 'Skeleton',
      health: 900,
      attack: 220,
      defence: 130,
      experienceReward: 250,
      coinReward: 50,
    ),
    Monster(
      row: 4,
      column: 6,
      name: 'Orc',
      health: 1200,
      attack: 300,
      defence: 180,
      experienceReward: 350,
      coinReward: 70,
    ),
    Monster(
      row: 2,
      column: 6,
      name: 'Dark Orc',
      health: 1500,
      attack: 350,
      defence: 220,
      experienceReward: 500,
      coinReward: 100,
    ),
    Monster(
      row: 1,
      column: 6,
      name: 'Elite Skeleton',
      health: 1100,
      attack: 280,
      defence: 170,
      experienceReward: 400,
      coinReward: 80,
    ),
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

    if (floor == 1) {
      return floor1[row][column];
    }

    if (floor == 2) {
      return floor2[row][column];
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
    final List<KeyItem> keys =
    activeFloor == 2 ? floor2Keys : floor1Keys;

    for (final key in keys) {
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
    final List<Door> doors =
    activeFloor == 2 ? floor2Doors : floor1Doors;

    for (final door in doors) {
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
    final List<Monster> monsters =
    activeFloor == 2 ? floor2Monsters : floor1Monsters;

    for (final monster in monsters) {
      if (monster.row == row &&
          monster.column == column &&
          !monster.isDefeated) {
        return monster;
      }
    }

    return null;
  }
}