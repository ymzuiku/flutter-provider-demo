import 'dart:collection';

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
  int get hashCode => 10;

  @override
  bool operator ==(other) => other is Item && other.id == id;
}

class CartModel extends ChangeNotifier {
  final List<Item> _items = [];
  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  int get totalPrice => _items.length;

  void add(Item item) {
    _items.add(item);
    notifyListeners();
  }

  void remove(Item item) {
    _items.remove(item);
    notifyListeners();
  }
}
