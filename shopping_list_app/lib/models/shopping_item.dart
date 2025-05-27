import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'shopping_item.freezed.dart';
part 'shopping_item.g.dart';

@freezed
@HiveType(typeId: 1)                           // ←  ID único para Hive
abstract class ShoppingItem with _$ShoppingItem {
  const ShoppingItem._();                      // ctor privado

  const factory ShoppingItem({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) @Default('') String quantity,
    @HiveField(3) @Default(false) bool done,
  }) = _ShoppingItem;

  factory ShoppingItem.fromJson(Map<String, dynamic> json) =>
      _$ShoppingItemFromJson(json);
}
