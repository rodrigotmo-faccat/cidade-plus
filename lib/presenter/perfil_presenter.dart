import '../view/perfil_view.dart';

class PerfilPresenter {
  final PerfilViewContract view;

  PerfilPresenter(this.view);

  void alterarCadastro(
      String nome, String email, String cidade, String bairro, String senha) {
    view.aoAlterar();
  }
}
