import 'package:flutter/material.dart';

const _itemNames = [
  'Code Smell',
  'Control Flow',
  'Interpreter',
  'Recursion',
  'Sprint',
  'Heisenbug',
  'Spaghetti',
  'Hydra Code',
  'Off-By-One',
  'Scope',
  'Callback',
  'Closure',
  'Automata',
  'Bit Shift',
  'Currying',
];

@immutable
class Item {
  final int id;
  final String name;
  Item(this.id) : name = _itemNames[id % _itemNames.length];

  @override
  int get hashCode => id;

  @override
  bool operator ==(other) => other is Item && other.id == id;
}

class CartModel extends ChangeNotifier {
  final Set<Item> items = new Set();
  final Set<Item> loadings = new Set();

  int get totalPrice => items.length;

  void add(Item item) async {
    loadings.add(item);
    notifyListeners();
    await Future.delayed(Duration(milliseconds: 1600));
    loadings.remove(item);
    items.add(item);
    notifyListeners();
  }

  void remove(Item item) {
    loadings.remove(item);
    items.remove(item);
    notifyListeners();
  }
}
