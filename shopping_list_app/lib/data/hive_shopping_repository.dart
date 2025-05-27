import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import '../models/shopping_list.dart';
import '../models/shopping_item.dart';
import 'shopping_repository.dart';

class HiveShoppingRepository implements IShoppingRepository {
  final Box<ShoppingList> _box = Hive.box<ShoppingList>('lists');
  final _uuid = const Uuid();

  /// Stream que emite primero el contenido actual y luego las actualizaciones
  @override
  Stream<List<ShoppingList>> watchLists() async* {
    yield _box.values.toList();                                // <-- inicial
    yield* _box.watch().map((_) => _box.values.toList());
  }

  @override
  Future<void> addList(String title) async {
    final id = _uuid.v4();
    await _box.put(id, ShoppingList(id: id, title: title));
  }

  @override
  Future<void> deleteList(String id) => _box.delete(id);

  // Helpers internos
  ShoppingList _get(String id) => _box.get(id)!;
  Future<void> _put(ShoppingList list) => _box.put(list.id, list);

  @override
  Future<void> addItem(String listId, String name, String quantity) async {
    final list = _get(listId);
    final updated = list.copyWith(items: [
      ...list.items,
      ShoppingItem(id: _uuid.v4(), name: name, quantity: quantity)
    ]);
    await _put(updated);
  }

  @override
  Future<void> toggleItemDone(String listId, String itemId) async {
    final list = _get(listId);
    await _put(list.copyWith(
      items: list.items
          .map((e) => e.id == itemId ? e.copyWith(done: !e.done) : e)
          .toList(),
    ));
  }

  @override
  Future<void> deleteItem(String listId, String itemId) async {
    final list = _get(listId);
    await _put(list.copyWith(
      items: list.items.where((e) => e.id != itemId).toList(),
    ));
  }
}
