import 'package:flutter/material.dart';
import '../presenter/demanda_presenter.dart';

const List<String> list = <String>['Iluminação', 'Buraco', 'Poda', 'Lixo'];

class DemandaView extends StatefulWidget {
  final DemandaPresenter presenter;

  DemandaView({required this.presenter});

  @override
  _DemandaViewState createState() => _DemandaViewState();
}

class _DemandaViewState extends State<DemandaView> {
  final TextEditingController _descricaoController = TextEditingController();
  final TextEditingController _enderecoController = TextEditingController();
  final TextEditingController _pontoDeReferenciaController =
      TextEditingController();
  String dropdownValue = list.first;

  @override
  void initState() {
    super.initState();
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
              onPressed: () async {
                String descricao = _descricaoController.text;
                String endereco = _enderecoController.text;
                String pontoDeReferencia = _pontoDeReferenciaController.text;
                String data = DateTime.now().toIso8601String();

                await widget.presenter.cadastrarDemanda(descricao, endereco,
                    pontoDeReferencia, dropdownValue, data);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Demanda cadastrada com sucesso!')),
                );
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
