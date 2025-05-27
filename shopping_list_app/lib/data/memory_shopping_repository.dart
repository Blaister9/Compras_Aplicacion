import 'dart:async';
import 'package:uuid/uuid.dart';
import 'shopping_repository.dart';
import '../models/shopping_item.dart';
import '../models/shopping_list.dart';

class MemoryShoppingRepository implements IShoppingRepository {
  final _uuid = const Uuid();
  final _controller = StreamController<List<ShoppingList>>.broadcast();
  final List<ShoppingList> _lists = [];

  MemoryShoppingRepository() {
    _emit();
  }

  @override
  Stream<List<ShoppingList>> watchLists() => _controller.stream;

  void _emit() => _controller.add(List.unmodifiable(_lists));

  @override
  Future<void> addList(String title) async {
    _lists.add(ShoppingList(id: _uuid.v4(), title: title));
    _emit();
  }

  @override
  Future<void> deleteList(String id) async {
    _lists.removeWhere((l) => l.id == id);
    _emit();
  }

  ShoppingList _find(String id) =>
      _lists.firstWhere((l) => l.id == id, orElse: () => throw 'not found');

  @override
  Future<void> addItem(String listId, String name, String quantity) async {
    final list = _find(listId);
    list.items.add(ShoppingItem(
      id: _uuid.v4(),
      name: name,
      quantity: quantity,
    ));
    _emit();
  }

  @override
  Future<void> toggleItemDone(String listId, String itemId) async {
    final list = _find(listId);
    final item = list.items.firstWhere((i) => i.id == itemId);
    final idx = list.items.indexOf(item);
    list.items[idx] = item.copyWith(done: !item.done);
    _emit();
  }

  @override
  Future<void> deleteItem(String listId, String itemId) async {
    final list = _find(listId);
    list.items.removeWhere((i) => i.id == itemId);
    _emit();
  }
}
