import 'package:flutter/material.dart';

class EditItemDialog extends StatefulWidget {
  const EditItemDialog({super.key, required this.name, required this.quantity});

  final String name;
  final String quantity;

  static Future<(String, String)?> show(
      BuildContext context, String name, String qty) {
    return showDialog<(String, String)>(
      context: context,
      builder: (_) => EditItemDialog(name: name, quantity: qty),
    );
  }

  @override
  State<EditItemDialog> createState() => _EditItemDialogState();
}

class _EditItemDialogState extends State<EditItemDialog> {
  late final _name = TextEditingController(text: widget.name);
  late final _qty = TextEditingController(text: widget.quantity);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Editar artículo'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(controller: _name, decoration: const InputDecoration(labelText: 'Nombre')),
          TextField(controller: _qty, decoration: const InputDecoration(labelText: 'Cantidad')),
        ],
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancelar')),
        ElevatedButton(
          onPressed: () => Navigator.pop(context, (_name.text, _qty.text)),
          child: const Text('Guardar'),
        ),
      ],
    );
  }
}

