import 'package:mobx/mobx.dart';
import 'package:we_pray/src/pedido/pedido_model.dart';
import 'package:we_pray/src/pedido/pedido_repository.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  @observable
  String verse;
  @observable
  String reference;
  @observable
  String verseUrl;
  @observable
  ObservableList<PedidoModel> _pedidos = ObservableList();
  @observable
  bool loading = true;

  @computed
  List<PedidoModel> get pedidos => _pedidos.reversed.toList();

  PedidoRepository _repo = PedidoRepository();

  _HomeStore() {
    _initialize();
  }

  @action
  Future<void> _initialize() async {
    getVerse();
    await getPedidos();

    loading = false;
  }

  @action
  void getVerse() {
    verse = '"Assim muitos darão graças por nossa causa, '
        'pelo favor a nós concedido em resposta às orações de muitos."';
    reference = '2 Coríntios 1:11';
    verseUrl = 'https://www.bibliaon.com/versiculo/2_corintios_1_11/';
  }

  @action
  Future<void> getPedidos() async {
    var list = await _repo.loadAll();
    _pedidos.addAll(list);
  }

  @action
  void addPedido(PedidoModel pedido) {
    _repo.save(pedido);
    _pedidos.add(pedido);
  }
}
