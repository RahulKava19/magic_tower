enum KeyColor {
  red,
  blue,
  yellow,
}

class KeyItem {
  final int row;
  final int column;
  final KeyColor color;

  bool isCollected;

  KeyItem({
    required this.row,
    required this.column,
    required this.color,
    this.isCollected = false,
  });
}