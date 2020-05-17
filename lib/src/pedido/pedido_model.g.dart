// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pedido_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PedidoModel _$PedidoModelFromJson(Map<String, dynamic> json) {
  return PedidoModel(
    id: json['id'] as String,
    autor: json['autor'] as String,
    pedido: json['pedido'] as String,
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
  );
}

Map<String, dynamic> _$PedidoModelToJson(PedidoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'autor': instance.autor,
      'pedido': instance.pedido,
      'date': instance.date?.toIso8601String(),
    };
