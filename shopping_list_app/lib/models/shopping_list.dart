import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'shopping_item.dart';

part 'shopping_list.freezed.dart';
part 'shopping_list.g.dart';

@freezed
@HiveType(typeId: 2)                           // ← diferente del 1
abstract class ShoppingList with _$ShoppingList {
  const ShoppingList._();                      // ctor privado

  const factory ShoppingList({
    @HiveField(0) required String id,
    @HiveField(1) required String title,
    @HiveField(2) @Default(<ShoppingItem>[]) List<ShoppingItem> items,
  }) = _ShoppingList;

  factory ShoppingList.fromJson(Map<String, dynamic> json) =>
      _$ShoppingListFromJson(json);
}
