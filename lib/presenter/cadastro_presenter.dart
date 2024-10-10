import '../view/cadastro_view.dart';

class CadastroPresenter {
  final CadastroViewContract view;

  CadastroPresenter(this.view);

  void cadastrar(String cpf, String nome, String email, String cidade,
      String bairro, String senha) {
    view.aoCadastrar();
  }
}
