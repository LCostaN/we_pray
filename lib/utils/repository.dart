import 'package:cloud_firestore/cloud_firestore.dart';

class Repository {
  static Repository _instance;

  Repository._() {
    pedido = Firestore.instance.collection('pedidos');
  }

  factory Repository() {
    return _instance ??= Repository._();
  }

  CollectionReference pedido;
}
