import 'package:cloud_firestore/cloud_firestore.dart';

class Demanda {
  final String id;
  final String descricao;
  final String endereco;
  final String pontoDeReferencia;
  final String categoria;
  final Timestamp data;

  Demanda({
    required this.id,
    required this.descricao,
    required this.endereco,
    required this.pontoDeReferencia,
    required this.categoria,
    required this.data,
  });

  factory Demanda.fromJson(Map<String, dynamic> json, String docId) {
    return Demanda(
      id: docId,
      descricao: json['descricao'],
      endereco: json['endereco'],
      pontoDeReferencia: json['ponto_de_referencia'],
      categoria: json['categoria'],
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'descricao': descricao,
      'endereco': endereco,
      'ponto_de_referencia': pontoDeReferencia,
      'categoria': categoria,
      'data': data,
    };
  }
}
