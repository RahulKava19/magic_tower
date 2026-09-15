import 'key.dart';

class Door {
  final int row;
  final int column;
  final KeyColor color;

  bool isOpen;

  Door({
    required this.row,
    required this.column,
    required this.color,
    this.isOpen = false,
  });
}