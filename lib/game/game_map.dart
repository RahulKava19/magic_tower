//To store the structure of the map

import '../models/door.dart';
import '../models/key.dart';

enum TileType {
  floor,
  wall,
}

class GameMap {
  static const int rows = 10;
  static const int columns = 10;

  static final List<KeyItem> floor1Keys = [
    KeyItem(
      row: 1,
      column: 1,
      color: KeyColor.red,
    ),
    KeyItem(
      row: 7,
      column: 2,
      color: KeyColor.blue,
    ),
    KeyItem(
      row: 8,
      column: 8,
      color: KeyColor.yellow,
    ),
  ];

  static final List<Door> floor1Doors = [
    Door(
      row: 2,
      column: 9,
      color: KeyColor.red,
    ),
    Door(
      row: 7,
      column: 5,
      color: KeyColor.blue,
    ),
    Door(
      row: 8,
      column: 5,
      color: KeyColor.yellow,
    ),
  ];
  static const List<List<TileType>> floor1 = [
    [
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.floor,
    ],
    [
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.wall,
      TileType.wall,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.floor,
    ],
    [
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.wall,
      TileType.floor,
      TileType.floor,
      TileType.wall,
      TileType.wall,
      TileType.floor,
    ],
    [
      TileType.floor,
      TileType.wall,
      TileType.wall,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.floor,
    ],
    [
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.wall,
      TileType.wall,
      TileType.floor,
      TileType.floor,
      TileType.floor,
    ],
    [
      TileType.floor,
      TileType.floor,
      TileType.wall,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.wall,
      TileType.floor,
    ],
    [
      TileType.floor,
      TileType.floor,
      TileType.wall,
      TileType.floor,
      TileType.wall,
      TileType.wall,
      TileType.floor,
      TileType.floor,
      TileType.wall,
      TileType.floor,
    ],
    [
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.wall,
      TileType.floor,
      TileType.floor,
    ],
    [
      TileType.floor,
      TileType.wall,
      TileType.wall,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.floor,
    ],
    [
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.floor,
      TileType.floor,
    ],
  ];

  static bool isWall(int row, int column) {
    return floor1[row][column] == TileType.wall;
  }

  static KeyItem? getKeyAt(int row, int column) {
    for (final key in floor1Keys) {
      if (key.row == row &&
          key.column == column &&
          !key.isCollected) {
        return key;
      }
    }

    return null;
  }

  static Door? getDoorAt(int row, int column) {
    for (final door in floor1Doors) {
      if (door.row == row && door.column == column) {
        return door;
      }
    }

    return null;
  }
}