class Conta {
  final int id;
  final String cpf;
  final String nome;
  final String email;
  final String cidade;
  final String bairro;
  final String senha;

  Conta(
      {required this.id,
      required this.cpf,
      required this.nome,
      required this.email,
      required this.cidade,
      required this.bairro,
      required this.senha});
}