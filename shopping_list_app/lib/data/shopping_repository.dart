import '../models/shopping_list.dart';

abstract class IShoppingRepository {
  Stream<List<ShoppingList>> watchLists();

  // Listas
  Future<void> addList(String title);
  Future<void> renameList(String id, String newTitle);     // ← NUEVO
  Future<void> deleteList(String id);

  // Ítems
  Future<void> addItem(String listId, String name, String quantity);
  Future<void> updateItem(                               // ← NUEVO
      String listId, String itemId, String name, String quantity);
  Future<void> toggleItemDone(String listId, String itemId);
  Future<void> deleteItem(String listId, String itemId);
}
