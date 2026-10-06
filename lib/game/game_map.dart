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
  // FLOOR 2
  // ============================================================

  static const List<List<TileType>> floor2 = [
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
      TileType.wall,
      TileType.wall,
      TileType.wall,
      TileType.wall,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.gate,
      TileType.wall,
    ],
    [
      TileType.wall,
      TileType.wall,
      TileType.wall,
      TileType.wall,
      TileType.wall,
      TileType.floor,
      TileType.wall,
      TileType.wall,
      TileType.wall,
      TileType.wall,
    ],
    [
      TileType.wall,
      TileType.wall,
      TileType.wall,
      TileType.wall,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.wall,
      TileType.wall,
      TileType.wall,
    ],
    [
      TileType.wall,
      TileType.wall,
      TileType.wall,
      TileType.wall,
      TileType.floor,
      TileType.wall,
      TileType.floor,
      TileType.wall,
      TileType.wall,
      TileType.wall,
    ],
    [
      TileType.wall,
      TileType.floor,
      TileType.wall,
      TileType.wall,
      TileType.floor,
      TileType.wall,
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
      TileType.wall,
      TileType.floor,
      TileType.wall,
    ],
    [
      TileType.wall,
      TileType.gate,
      TileType.floor,
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
  // KEYS - FLOOR 1
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
      column: 1,
      color: KeyColor.yellow,
    ),
    KeyItem(
      row: 7,
      column: 8,
      color: KeyColor.blue,
    ),
  ];

  // ============================================================
  // KEYS - FLOOR 2
  // ============================================================

  static final List<KeyItem> floor2Keys = [
    KeyItem(
      row: 5,
      column: 1,
      color: KeyColor.yellow,
    ),
    KeyItem(
      row: 7,
      column: 6,
      color: KeyColor.blue,
    ),
    KeyItem(
      row: 7,
      column: 8,
      color: KeyColor.red,
    ),
  ];

  // ============================================================
  // DOORS - FLOOR 1
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
  // DOORS - FLOOR 2
  // ============================================================

  static final List<Door> floor2Doors = [
    Door(
      row: 3,
      column: 4,
      color: KeyColor.yellow,
    ),
    Door(
      row: 5,
      column: 7,
      color: KeyColor.blue,
    ),
    Door(
      row: 1,
      column: 7,
      color: KeyColor.red,
    ),
  ];

  // ============================================================
  // MONSTERS - FLOOR 1
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
  // MONSTERS - FLOOR 2
  // ============================================================

  static final List<Monster> floor2Monsters = [
    Monster(
      row: 6,
      column: 1,
      name: 'Armored Skeleton',
      health: 800,
      attack: 200,
      defence: 120,
      experienceReward: 250,
      coinReward: 50,
    ),
    Monster(
      row: 4,
      column: 6,
      name: 'Orc Warrior',
      health: 1000,
      attack: 230,
      defence: 140,
      experienceReward: 400,
      coinReward: 80,
    ),
    Monster(
      row: 1,
      column: 6,
      name: 'Dark Knight',
      health: 1300,
      attack: 250,
      defence: 150,
      experienceReward: 600,
      coinReward: 150,
    ),
  ];

  // ============================================================
  // FLOOR LIST HELPERS
  // ============================================================

  static List<KeyItem> getKeysForFloor(int floor) {
    if (floor == 1) {
      return floor1Keys;
    }
    if (floor == 2) {
      return floor2Keys;
    }
    return const [];
  }

  static List<Door> getDoorsForFloor(int floor) {
    if (floor == 1) {
      return floor1Doors;
    }
    if (floor == 2) {
      return floor2Doors;
    }
    return const [];
  }

  static List<Monster> getMonstersForFloor(int floor) {
    if (floor == 1) {
      return floor1Monsters;
    }
    if (floor == 2) {
      return floor2Monsters;
    }
    return const [];
  }

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

    return TileType.wall;
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
      int floor,
      int row,
      int column,
      ) {
    for (final key in getKeysForFloor(floor)) {
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
      int floor,
      int row,
      int column,
      ) {
    for (final door in getDoorsForFloor(floor)) {
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
      int floor,
      int row,
      int column,
      ) {
    for (final monster in getMonstersForFloor(floor)) {
      if (monster.row == row &&
          monster.column == column &&
          !monster.isDefeated) {
        return monster;
      }
    }

    return null;
  }
}