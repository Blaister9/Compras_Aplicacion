import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'data/hive_shopping_repository.dart';
import 'data/shopping_repository.dart';

final shoppingRepoProvider = Provider<IShoppingRepository>((ref) {
  return HiveShoppingRepository();     // ← antes era MemoryShoppingRepository
});

