import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/shopping_list.dart';
import '../providers.dart';
import 'list_detail_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.watch(shoppingRepoProvider);

    return StreamBuilder<List<ShoppingList>>(
      stream: repo.watchLists(),
      builder: (context, snapshot) {
        final lists = snapshot.data ?? [];

        return Scaffold(
          appBar: AppBar(title: const Text('Mis listas')),
          body: ListView.builder(
            itemCount: lists.length,
            itemBuilder: (_, i) {
              final l = lists[i];
              return ListTile(
                title: Text(l.title),
                subtitle:
                    Text('${l.items.where((e) => !e.done).length} pendientes'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        ListDetailScreen(listId: l.id, title: l.title),
                  ),
                ),
                trailing: PopupMenuButton<String>(
                  onSelected: (value) async {
                    if (value == 'rename') {
                      final title =
                          await _inputDialog(context, 'Nuevo nombre', l.title);
                      if (title != null && title.trim().isNotEmpty) {
                        repo.renameList(l.id, title.trim());
                      }
                    } else if (value == 'delete') {
                      repo.deleteList(l.id);
                    }
                  },
                  itemBuilder: (_) => const [
                    PopupMenuItem(value: 'rename', child: Text('Renombrar')),
                    PopupMenuItem(value: 'delete', child: Text('Eliminar')),
                  ],
                ),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              final title = await _inputDialog(context, 'Nombre de la lista');
              if (title != null && title.trim().isNotEmpty) {
                repo.addList(title.trim());
              }
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }

  Future<String?> _inputDialog(BuildContext context, String hint,
      [String initial = '']) {
    final controller = TextEditingController(text: initial);
    return showDialog<String>(
      context: context,
      builder: (c) => AlertDialog(
        title: Text(hint),
        content: TextField(controller: controller, autofocus: true),
        actions: [
          TextButton(onPressed: () => Navigator.pop(c), child: const Text('Cancelar')),
          ElevatedButton(onPressed: () => Navigator.pop(c, controller.text), child: const Text('OK')),
        ],
      ),
    );
  }
}
