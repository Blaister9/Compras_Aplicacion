import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/shopping_list.dart';
import '../providers.dart';
import '../widgets/edit_item_dialog.dart';
import 'package:collection/collection.dart';

class ListDetailScreen extends ConsumerWidget {
  const ListDetailScreen({
    super.key,
    required this.listId,
    required this.title,
  });

  final String listId;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.watch(shoppingRepoProvider);

    return StreamBuilder<ShoppingList?>(
      stream: repo.watchLists().map(
            (lists) => lists.firstWhereOrNull(
              (l) => l.id == listId,
            ),
          ),
      builder: (context, snap) {
        final list = snap.data;
        if (list == null) {
          return Scaffold(
            appBar: AppBar(title: Text(title)),
            body: const Center(child: Text('Lista eliminada')),
          );
        }

        return Scaffold(
          appBar: AppBar(title: Text(list.title)),
          body: ListView.builder(
            itemCount: list.items.length,
            itemBuilder: (_, i) {
              final item = list.items[i];
              return ListTile(
                leading: Checkbox(
                  value: item.done,
                  onChanged: (_) =>
                      repo.toggleItemDone(list.id, item.id),
                ),
                title: Text(
                  item.name,
                  style: item.done
                      ? const TextStyle(
                          decoration: TextDecoration.lineThrough)
                      : null,
                ),
                subtitle: Text(item.quantity),
                onTap: () async {
                  // ── Editar ──
                  final result = await EditItemDialog.show(
                      context, item.name, item.quantity);
                  if (result != null) {
                    final (newName, newQty) = result;
                    repo.updateItem(
                        list.id, item.id, newName.trim(), newQty.trim());
                  }
                },
                onLongPress: () => repo.deleteItem(list.id, item.id),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () async {
              final name = await _input(context, 'Artículo');
              if (name == null || name.trim().isEmpty) return;
              final qty = await _input(context, 'Cantidad', '');
              repo.addItem(list.id, name.trim(), qty?.trim() ?? '');
            },
          ),
        );
      },
    );
  }

  Future<String?> _input(BuildContext ctx, String label,
      [String initial = '']) {
    final c = TextEditingController(text: initial);
    return showDialog<String>(
      context: ctx,
      builder: (_) => AlertDialog(
        title: Text(label),
        content: TextField(controller: c, autofocus: true),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Cancelar')),
          ElevatedButton(
              onPressed: () => Navigator.pop(ctx, c.text),
              child: const Text('OK')),
        ],
      ),
    );
  }
}
