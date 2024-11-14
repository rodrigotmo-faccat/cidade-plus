import 'package:trab_dispositivos_moveis/model/demanda_model.dart';

abstract class DemandaView {
  void displayDemandas(List<Demanda> demandas);
  void showError(String error);
}
