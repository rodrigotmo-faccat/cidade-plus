import 'package:flutter/material.dart';
import '../presenter/cadastro_presenter.dart';

// Contrato que define o que a view do login deve implementar
abstract class CadastroViewContract {
  void aoCadastrar();
}

class CadastroView extends StatefulWidget {
  const CadastroView({super.key});

  @override
  _CadastroViewState createState() => _CadastroViewState();
}

class _CadastroViewState extends State<CadastroView>
    implements CadastroViewContract {
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cidadeController = TextEditingController();
  final TextEditingController _bairroController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  late CadastroPresenter _presenter;

  @override
  void initState() {
    super.initState();
    _presenter = CadastroPresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crie sua conta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _cpfController,
              decoration: const InputDecoration(labelText: 'CPF'),
            ),
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _cidadeController,
              decoration: const InputDecoration(labelText: 'Cidade'),
            ),
            TextField(
              controller: _bairroController,
              decoration: const InputDecoration(labelText: 'Bairro'),
            ),
            TextField(
              controller: _senhaController,
              decoration: const InputDecoration(labelText: 'Senha'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String cpf = _cpfController.text;
                String nome = _nomeController.text;
                String email = _nomeController.text;
                String cidade = _nomeController.text;
                String bairro = _nomeController.text;
                String senha = _nomeController.text;
                _presenter.cadastrar(cpf, nome, email, cidade, bairro, senha);
              },
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void aoCadastrar() {
    Navigator.pushReplacementNamed(context, '/login');
  }
}
