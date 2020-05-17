import 'dart:math';

import 'package:flutter/material.dart';
import 'package:we_pray/src/pedido/pedido_model.dart';

class NovoPedidoDialog extends StatelessWidget {
  const NovoPedidoDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String autor;
    String pedido;

    return AlertDialog(
      title: Text('Pedido de Oração'),
      content: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: min(500, MediaQuery.of(context).size.width * 0.8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              maxLines: 1,
              decoration: InputDecoration(
                labelText: 'Autor(a)',
              ),
              onChanged: (value) => autor = value,
            ),
            TextFormField(
              minLines: 3,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Pedido',
              ),
              onChanged: (value) => pedido = value,
            ),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () => _validateAndPop(context, autor, pedido),
          child: Text('Confirmar'),
        )
      ],
    );
  }

  void _validateAndPop(BuildContext context, String autor, String pedido) {
    if (pedido != null) {
      Navigator.of(context).pop(PedidoModel(autor: autor, pedido: pedido));
    }
  }
}
