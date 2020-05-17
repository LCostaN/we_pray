import 'package:flutter/material.dart';
import 'package:we_pray/src/pedido/pedido_model.dart';

class PedidoUi extends StatefulWidget {
  const PedidoUi({
    Key key,
    @required this.index,
    @required this.pedido,
  }) : super(key: key);

  final int index;
  final PedidoModel pedido;

  @override
  _PedidoUiState createState() => _PedidoUiState();
}

class _PedidoUiState extends State<PedidoUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Pedido de Oração'),
      ),
      body: Hero(
        tag: 'PedidoHeroTag${widget.index}',
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Text(
                    widget.pedido.pedido,
                    textAlign: TextAlign.justify,
                  ),
                ),
                widget.pedido.autor == null
                    ? Container()
                    : Align(
                        alignment: Alignment.centerRight,
                        child: FlatButton(
                          child: Text(
                            widget.pedido.autor,
                            style: Theme.of(context).textTheme.bodyText2.apply(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                          ),
                          onPressed: null,
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
