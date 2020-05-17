// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStore, Store {
  Computed<List<PedidoModel>> _$pedidosComputed;

  @override
  List<PedidoModel> get pedidos =>
      (_$pedidosComputed ??= Computed<List<PedidoModel>>(() => super.pedidos))
          .value;

  final _$verseAtom = Atom(name: '_HomeStore.verse');

  @override
  String get verse {
    _$verseAtom.context.enforceReadPolicy(_$verseAtom);
    _$verseAtom.reportObserved();
    return super.verse;
  }

  @override
  set verse(String value) {
    _$verseAtom.context.conditionallyRunInAction(() {
      super.verse = value;
      _$verseAtom.reportChanged();
    }, _$verseAtom, name: '${_$verseAtom.name}_set');
  }

  final _$referenceAtom = Atom(name: '_HomeStore.reference');

  @override
  String get reference {
    _$referenceAtom.context.enforceReadPolicy(_$referenceAtom);
    _$referenceAtom.reportObserved();
    return super.reference;
  }

  @override
  set reference(String value) {
    _$referenceAtom.context.conditionallyRunInAction(() {
      super.reference = value;
      _$referenceAtom.reportChanged();
    }, _$referenceAtom, name: '${_$referenceAtom.name}_set');
  }

  final _$verseUrlAtom = Atom(name: '_HomeStore.verseUrl');

  @override
  String get verseUrl {
    _$verseUrlAtom.context.enforceReadPolicy(_$verseUrlAtom);
    _$verseUrlAtom.reportObserved();
    return super.verseUrl;
  }

  @override
  set verseUrl(String value) {
    _$verseUrlAtom.context.conditionallyRunInAction(() {
      super.verseUrl = value;
      _$verseUrlAtom.reportChanged();
    }, _$verseUrlAtom, name: '${_$verseUrlAtom.name}_set');
  }

  final _$_pedidosAtom = Atom(name: '_HomeStore._pedidos');

  @override
  ObservableList<PedidoModel> get _pedidos {
    _$_pedidosAtom.context.enforceReadPolicy(_$_pedidosAtom);
    _$_pedidosAtom.reportObserved();
    return super._pedidos;
  }

  @override
  set _pedidos(ObservableList<PedidoModel> value) {
    _$_pedidosAtom.context.conditionallyRunInAction(() {
      super._pedidos = value;
      _$_pedidosAtom.reportChanged();
    }, _$_pedidosAtom, name: '${_$_pedidosAtom.name}_set');
  }

  final _$loadingAtom = Atom(name: '_HomeStore.loading');

  @override
  bool get loading {
    _$loadingAtom.context.enforceReadPolicy(_$loadingAtom);
    _$loadingAtom.reportObserved();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.context.conditionallyRunInAction(() {
      super.loading = value;
      _$loadingAtom.reportChanged();
    }, _$loadingAtom, name: '${_$loadingAtom.name}_set');
  }

  final _$_initializeAsyncAction = AsyncAction('_initialize');

  @override
  Future _initialize() {
    return _$_initializeAsyncAction.run(() => super._initialize());
  }

  final _$getPedidosAsyncAction = AsyncAction('getPedidos');

  @override
  Future<void> getPedidos() {
    return _$getPedidosAsyncAction.run(() => super.getPedidos());
  }

  final _$_HomeStoreActionController = ActionController(name: '_HomeStore');

  @override
  void getVerse() {
    final _$actionInfo = _$_HomeStoreActionController.startAction();
    try {
      return super.getVerse();
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addPedido(PedidoModel pedido) {
    final _$actionInfo = _$_HomeStoreActionController.startAction();
    try {
      return super.addPedido(pedido);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }
}
