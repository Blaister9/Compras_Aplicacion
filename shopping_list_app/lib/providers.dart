import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'data/memory_shopping_repository.dart';
import 'data/shopping_repository.dart';

final shoppingRepoProvider = Provider<IShoppingRepository>((ref) {
  return MemoryShoppingRepository(); // cambiará a FirebaseRepo en Sprint 1
});
