import '../dao/demanda_dao.dart';
import 'package:trab_dispositivos_moveis/model/demanda_model.dart';

class DemandaPresenter {
  final DemandaDao db;

  DemandaPresenter(this.db);

  Future<void> cadastrarDemanda(String descricao, String endereco,
      String pontoDeReferencia, String categoria, String data) async {
    Demanda demanda = Demanda(
        descricao: descricao,
        endereco: endereco,
        pontoDeReferencia: pontoDeReferencia,
        categoria: categoria,
        data: data);
    await db.inserirDemanda(demanda);
  }
}
