import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trab_dispositivos_moveis/view/demanda_view.dart';
import 'package:trab_dispositivos_moveis/model/demanda_model.dart';

class DemandaPresenter {
  final DemandaView view;
  final CollectionReference demandasRef =
      FirebaseFirestore.instance.collection('demandas');

  DemandaPresenter(this.view);

  Future<void> fetchDemandasFirebase() async {
    try {
      QuerySnapshot snapshot =
          await demandasRef.orderBy('data', descending: true).get();

      List<Demanda> demandas = snapshot.docs.map((doc) {
        return Demanda.fromJson(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();

      view.displayDemandas(demandas);
    } catch (e) {
      // Captura exceções e exibe a mensagem de erro.
      view.showError('Erro ao buscar dados: $e');
    }
  }

  Future<void> addDemandaFirebase(Demanda demanda) async {
    try {
      print("Salvando demanda no Firestore: ${demanda.toJson()}");
      await demandasRef.add(demanda.toJson());
    } catch (e) {
      view.showError('Erro ao adicionar tarefa: $e');
    }
  }

  Future<void> deleteDemandaFirebase(String docId) async {
    try {
      await demandasRef.doc(docId).delete();

      fetchDemandasFirebase();
    } catch (e) {
      // Captura exceções e exibe a mensagem de erro.
      view.showError('Erro ao deletar tarefa: $e');
    }
  }
}
