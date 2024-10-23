import 'package:flutter/material.dart';
import '../presenter/perfil_presenter.dart';

// Contrato que define o que a view do login deve implementar
abstract class PerfilViewContract {
  void aoAlterar();
}

class PerfilView extends StatefulWidget {
  const PerfilView({super.key});

  @override
  _PerfilViewState createState() => _PerfilViewState();
}

class _PerfilViewState extends State<PerfilView> implements PerfilViewContract {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cidadeController = TextEditingController();
  final TextEditingController _bairroController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  late PerfilPresenter _presenter;

  @override
  void initState() {
    super.initState();
    _presenter = PerfilPresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alterar dados'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nome',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _cidadeController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Cidade',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _bairroController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Bairro',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _senhaController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Senha',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String nome = _nomeController.text;
                String email = _nomeController.text;
                String cidade = _nomeController.text;
                String bairro = _nomeController.text;
                String senha = _nomeController.text;
                _presenter.alterarCadastro(nome, email, cidade, bairro, senha);
              },
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void aoAlterar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Perfil salvo com sucesso')),
    );
    Navigator.pushReplacementNamed(context, '/home');
  }
}
