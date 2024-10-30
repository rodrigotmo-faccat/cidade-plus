import '../view/demanda_view.dart';

class DemandaPresenter {
  final DemandaViewContract view;

  DemandaPresenter(this.view);

  void cadastrarDemanda(String descricao, String endereco,
      String pontoDeReferencia, String categoria, String data) {
    view.aoCadastrarDemanda();
  }
}
