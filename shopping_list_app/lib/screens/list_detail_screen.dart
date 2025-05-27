import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers.dart';

class ListDetailScreen extends ConsumerWidget {
  final String listId;
  final String title;
  const ListDetailScreen({super.key, required this.listId, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.watch(shoppingRepoProvider);
    return StreamBuilder(
      stream: repo.watchLists(),
      builder: (context, snapshot) {
        final list = (snapshot.data ?? []).firstWhere((l) => l.id == listId);
        return Scaffold(
          appBar: AppBar(title: Text(title)),
          body: ListView.builder(
            itemCount: list.items.length,
            itemBuilder: (_, i) {
              final item = list.items[i];
              return CheckboxListTile(
                value: item.done,
                title: Text(item.name),
                subtitle: item.quantity.isEmpty ? null : Text(item.quantity),
                onChanged: (_) => repo.toggleItemDone(listId, item.id),
                secondary: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => repo.deleteItem(listId, item.id),
                ),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              final name = await _itemDialog(context);
              if (name != null && name.trim().isNotEmpty) {
                repo.addItem(listId, name.trim(), '');
              }
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }

  Future<String?> _itemDialog(BuildContext context) {
    final controller = TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (c) => AlertDialog(
        title: const Text('Añadir artículo'),
        content: TextField(controller: controller, autofocus: true),
        actions: [
          TextButton(onPressed: () => Navigator.pop(c), child: const Text('Cancelar')),
          ElevatedButton(onPressed: () => Navigator.pop(c, controller.text), child: const Text('OK')),
        ],
      ),
    );
  }
}
