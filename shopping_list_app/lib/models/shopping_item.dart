import 'package:freezed_annotation/freezed_annotation.dart';

part 'shopping_item.freezed.dart';
part 'shopping_item.g.dart';

@freezed
abstract class ShoppingItem with _$ShoppingItem {
  const ShoppingItem._();                    // ctor privado

  const factory ShoppingItem({
    required String id,
    required String name,
    @Default('') String quantity,
    @Default(false) bool done,
  }) = _ShoppingItem;

  factory ShoppingItem.fromJson(Map<String, dynamic> json) =>
      _$ShoppingItemFromJson(json);
}


