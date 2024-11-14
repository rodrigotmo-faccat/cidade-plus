import 'package:trab_dispositivos_moveis/model/usuario_model.dart';

import '../view/cadastro_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CadastroPresenter {
  final CadastroView view;
  final CollectionReference tarefasRef =
      FirebaseFirestore.instance.collection('usuarios');

  CadastroPresenter(this.view);

  Future<void> addUsuarioFirebase(Usuario usuario) async {
    try {
      print("Salvando usuário no Firestore: ${usuario.toJson()}");
      await tarefasRef.add(usuario.toJson());
    } catch (e) {
      view.showError('Erro ao adicionar tarefa: $e');
    }
  }
}
