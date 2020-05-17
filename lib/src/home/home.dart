import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:we_pray/src/home/home_store.dart';
import 'package:we_pray/src/home/novo_pedido_dialog.dart';
import 'package:we_pray/src/pedido/pedido_model.dart';
import 'package:we_pray/src/pedido/pedido_ui.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeStore store;

  final DateFormat dateFormat = DateFormat('dd/MM/yyyy');

  @override
  void initState() {
    super.initState();
    store = HomeStore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('WePray'),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(12),
        child: Observer(
          builder: (context) => store.loading
              ? Center(child: CircularProgressIndicator())
              : Column(
                  children: <Widget>[
                    Card(
                      margin: const EdgeInsets.only(bottom: 24.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 100,
                              padding: const EdgeInsets.only(right: 16.0),
                              child: SingleChildScrollView(
                                child: Text(
                                  store.verse,
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: FlatButton(
                                child: Text(
                                  store.reference,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .apply(
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline,
                                      ),
                                ),
                                onPressed: () => launch(store.verseUrl),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 16,
                      ),
                      color: Colors.indigo,
                      alignment: Alignment.center,
                      child: Text(
                        'Pedidos de Oração',
                        style: Theme.of(context).textTheme.bodyText1.apply(
                              color: Colors.white,
                              fontWeightDelta: 2,
                              fontSizeDelta: 2,
                            ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        // TODO: Add a stream here for fast update.
                        itemCount: store.pedidos.length == 0
                            ? 1
                            : store.pedidos.length,
                        itemBuilder: (context, i) => store.pedidos.length == 0
                            ? Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(16.0),
                                child: Text('Nenhum pedido no momento'),
                              )
                            : Hero(
                                tag: 'PedidoHeroTag$i',
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: GestureDetector(
                                      onTap: () => _viewPedido(i),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            height: 100,
                                            padding: const EdgeInsets.only(
                                                right: 16.0),
                                            child: Text(
                                              store.pedidos[i].pedido,
                                              textAlign: TextAlign.justify,
                                              maxLines: 4,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          store.pedidos[i].autor == null
                                              ? Container()
                                              : Row(
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        dateFormat.format(store
                                                            .pedidos[i].date),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: FlatButton(
                                                        child: Text(
                                                          store
                                                              .pedidos[i].autor,
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyText2
                                                                  .apply(
                                                                    color: Colors
                                                                        .blue,
                                                                    decoration:
                                                                        TextDecoration
                                                                            .underline,
                                                                  ),
                                                        ),
                                                        onPressed: null,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addPedido,
        tooltip: 'Fazer Pedido',
        child: Icon(Icons.add),
      ),
    );
  }

  void _viewPedido(int i) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 800),
        pageBuilder: (context, _, __) =>
            PedidoUi(index: i, pedido: store.pedidos[i]),
        transitionsBuilder: (context, animation, _, child) => FadeTransition(
          opacity: CurvedAnimation(parent: animation, curve: Curves.ease),
          child: child,
        ),
      ),
    );
  }

  void _addPedido() async {
    var pedido = await showDialog<PedidoModel>(
      context: context,
      builder: (context) => NovoPedidoDialog(),
    );

    store.addPedido(pedido);
  }
}
