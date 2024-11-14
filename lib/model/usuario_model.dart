import 'package:cloud_firestore/cloud_firestore.dart';

class Usuario {
  final String id;
  final String cpf;
  final String nome;
  final String email;
  final String cidade;
  final String bairro;
  final String senha;
  final Timestamp data;

  Usuario(
      {required this.id,
      required this.cpf,
      required this.nome,
      required this.email,
      required this.cidade,
      required this.bairro,
      required this.senha,
      required this.data});

  factory Usuario.fromJson(Map<String, dynamic> json, String docId) {
    return Usuario(
      id: docId,
      cpf: json['cpf'],
      nome: json['nome'],
      email: json['email'],
      cidade: json['cidade'],
      bairro: json['bairro'],
      senha: json['senha'],
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cpf': cpf,
      'nome': nome,
      'email': email,
      'cidade': cidade,
      'bairro': bairro,
      'senha': senha,
      'data': data,
    };
  }
}
