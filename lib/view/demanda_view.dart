import 'package:flutter/material.dart';
import '../presenter/demanda_presenter.dart';

const List<String> list = <String>['Iluminaçao', 'Buraco', 'Poda', 'Lixo'];

abstract class DemandaViewContract {
  void aoCadastrarDemanda();
}

class DemandaView extends StatefulWidget {
  const DemandaView({super.key});

  @override
  _DemandaViewState createState() => _DemandaViewState();
}

class _DemandaViewState extends State<DemandaView>
    implements DemandaViewContract {
  final TextEditingController _descricaoController = TextEditingController();
  final TextEditingController _enderecoController = TextEditingController();
  final TextEditingController _pontoDeReferenciaController =
      TextEditingController();
  late DemandaPresenter _presenter;
  String dropdownValue = list.first;

  @override
  void initState() {
    super.initState();
    _presenter = DemandaPresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de demanda'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _descricaoController,
              decoration: const InputDecoration(labelText: 'Descricao'),
            ),
            TextField(
              controller: _enderecoController,
              decoration: const InputDecoration(labelText: 'Endereço'),
            ),
            TextField(
              controller: _pontoDeReferenciaController,
              decoration:
                  const InputDecoration(labelText: 'Ponto de referência'),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: DropdownMenu<String>(
                initialSelection: list.first,
                hintText: 'Categoria',
                onSelected: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                dropdownMenuEntries:
                    list.map<DropdownMenuEntry<String>>((String value) {
                  return DropdownMenuEntry<String>(value: value, label: value);
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String descricao = _descricaoController.text;
                String endereco = _enderecoController.text;
                String pontoDeReferencia = _pontoDeReferenciaController.text;
                String data = DateTime.now().toIso8601String();
                _presenter.cadastrarDemanda(descricao, endereco,
                    pontoDeReferencia, dropdownValue, data);
              },
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void aoCadastrarDemanda() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Demanda cadastrada com sucesso!')),
    );
    Navigator.pushReplacementNamed(context, '/home');
  }
}
