import 'package:flutter/material.dart';

class EditItemDialog extends StatefulWidget {
  const EditItemDialog({
    super.key,
    required this.initialName,
    required this.initialQty,
  });

  final String initialName;
  final String initialQty;

  /// Utiliza esta helper estática para abrir el diálogo y
  /// obtener `(nuevoNombre, nuevaCant)` o `null` si se canceló.
  static Future<(String, String)?> show(
    BuildContext ctx,
    String name,
    String qty,
  ) {
    return showDialog<(String, String)>(
      context: ctx,
      builder: (_) => EditItemDialog(initialName: name, initialQty: qty),
    );
  }

  @override
  State<EditItemDialog> createState() => _EditItemDialogState();
}

class _EditItemDialogState extends State<EditItemDialog> {
  late final _name = TextEditingController(text: widget.initialName);
  late final _qty = TextEditingController(text: widget.initialQty);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Editar artículo'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _name,
            decoration: const InputDecoration(labelText: 'Nombre'),
            autofocus: true,
          ),
          TextField(
            controller: _qty,
            decoration: const InputDecoration(labelText: 'Cantidad'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () =>
              Navigator.pop(context, (_name.text, _qty.text)),
          child: const Text('Guardar'),
        ),
      ],
    );
  }
}
