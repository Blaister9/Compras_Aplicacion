import '../models/shopping_list.dart';

abstract class IShoppingRepository {
  Stream<List<ShoppingList>> watchLists();
  Future<void> addList(String title);
  Future<void> deleteList(String id);

  Future<void> addItem(String listId, String name, String quantity);
  Future<void> toggleItemDone(String listId, String itemId);
  Future<void> deleteItem(String listId, String itemId);
}
