class Demanda {
  final String descricao;
  final String endereco;
  final String pontoDeReferencia;
  final String categoria;
  final String data;

  Demanda({
    required this.descricao,
    required this.endereco,
    required this.pontoDeReferencia,
    required this.categoria,
    required this.data,
  });

  factory Demanda.fromJson(Map<String, dynamic> json) {
    return Demanda(
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
