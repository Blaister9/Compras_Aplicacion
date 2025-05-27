// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ShoppingItem _$ShoppingItemFromJson(Map<String, dynamic> json) {
  return _ShoppingItem.fromJson(json);
}

/// @nodoc
mixin _$ShoppingItem {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String get quantity => throw _privateConstructorUsedError;
  @HiveField(3)
  bool get done => throw _privateConstructorUsedError;

  /// Serializes this ShoppingItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShoppingItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShoppingItemCopyWith<ShoppingItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingItemCopyWith<$Res> {
  factory $ShoppingItemCopyWith(
          ShoppingItem value, $Res Function(ShoppingItem) then) =
      _$ShoppingItemCopyWithImpl<$Res, ShoppingItem>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String quantity,
      @HiveField(3) bool done});
}

/// @nodoc
class _$ShoppingItemCopyWithImpl<$Res, $Val extends ShoppingItem>
    implements $ShoppingItemCopyWith<$Res> {
  _$ShoppingItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShoppingItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? quantity = null,
    Object? done = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShoppingItemImplCopyWith<$Res>
    implements $ShoppingItemCopyWith<$Res> {
  factory _$$ShoppingItemImplCopyWith(
          _$ShoppingItemImpl value, $Res Function(_$ShoppingItemImpl) then) =
      __$$ShoppingItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String quantity,
      @HiveField(3) bool done});
}

/// @nodoc
class __$$ShoppingItemImplCopyWithImpl<$Res>
    extends _$ShoppingItemCopyWithImpl<$Res, _$ShoppingItemImpl>
    implements _$$ShoppingItemImplCopyWith<$Res> {
  __$$ShoppingItemImplCopyWithImpl(
      _$ShoppingItemImpl _value, $Res Function(_$ShoppingItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShoppingItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? quantity = null,
    Object? done = null,
  }) {
    return _then(_$ShoppingItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShoppingItemImpl extends _ShoppingItem {
  const _$ShoppingItemImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) this.quantity = '',
      @HiveField(3) this.done = false})
      : super._();

  factory _$ShoppingItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShoppingItemImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String name;
  @override
  @JsonKey()
  @HiveField(2)
  final String quantity;
  @override
  @JsonKey()
  @HiveField(3)
  final bool done;

  @override
  String toString() {
    return 'ShoppingItem(id: $id, name: $name, quantity: $quantity, done: $done)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoppingItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.done, done) || other.done == done));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, quantity, done);

  /// Create a copy of ShoppingItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShoppingItemImplCopyWith<_$ShoppingItemImpl> get copyWith =>
      __$$ShoppingItemImplCopyWithImpl<_$ShoppingItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShoppingItemImplToJson(
      this,
    );
  }
}

abstract class _ShoppingItem extends ShoppingItem {
  const factory _ShoppingItem(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String name,
      @HiveField(2) final String quantity,
      @HiveField(3) final bool done}) = _$ShoppingItemImpl;
  const _ShoppingItem._() : super._();

  factory _ShoppingItem.fromJson(Map<String, dynamic> json) =
      _$ShoppingItemImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  String get quantity;
  @override
  @HiveField(3)
  bool get done;

  /// Create a copy of ShoppingItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShoppingItemImplCopyWith<_$ShoppingItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
