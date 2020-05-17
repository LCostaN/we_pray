import 'package:we_pray/interfaces/object_repository.dart';
import 'package:we_pray/src/pedido/pedido_model.dart';
import 'package:we_pray/utils/repository.dart';

class PedidoRepository implements ObjectRepository<PedidoModel> {
  Future<List<PedidoModel>> loadAll() async {
    var query = await Repository()
        .pedido
        .orderBy('date', descending: false)
        .limit(20)
        .getDocuments();
    var docs = query.documents;

    var list = docs
        .map(
          (d) => PedidoModel(
            id: d.documentID,
            autor: d.data['autor'],
            pedido: d.data['pedido'],
            date: DateTime.tryParse(d.data['date']),
          ),
        )
        .toList();

    return list;
  }

  @override
  Future<PedidoModel> load(String id) async {
    PedidoModel item;
    var doc = await Repository().pedido.document(id).get();
    if (doc.exists) {
      item = PedidoModel(
        id: doc.documentID,
        autor: doc.data['autor'],
        pedido: doc.data['pedido'],
        date: DateTime.tryParse(doc.data['date']),
      );
    }

    return item;
  }

  @override
  void save(PedidoModel item) {
    Repository().pedido.add(item.toJson());
  }
}
