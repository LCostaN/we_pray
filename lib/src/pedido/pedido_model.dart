import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pedido_model.g.dart';

@JsonSerializable()
class PedidoModel {
  String id;
  final String autor;
  final String pedido;
  final DateTime _date;

  PedidoModel({this.id, this.autor, @required this.pedido, DateTime date})
      : _date = date ?? DateTime.now();

  factory PedidoModel.fromJson(Map<String, dynamic> json) =>
      _$PedidoModelFromJson(json);

  Map<String, dynamic> toJson() => _$PedidoModelToJson(this);

  DateTime get date => _date;
}
