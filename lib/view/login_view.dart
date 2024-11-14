import 'package:flutter/material.dart';
import 'package:trab_dispositivos_moveis/presenter/cadastro_presenter.dart';
import 'package:trab_dispositivos_moveis/view/cadastro_form_page.dart';
import 'package:trab_dispositivos_moveis/view/cadastro_view.dart';
import '../presenter/login_presenter.dart';

abstract class LoginViewContract {
  void onLoginSuccess();
  void onLoginError(String error);
}

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView>
    implements LoginViewContract, CadastroView {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late LoginPresenter _presenter;
  late CadastroPresenter cadastroPresenter;

  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    _presenter = LoginPresenter(this);
    cadastroPresenter = CadastroPresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Usuário'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String username = _usernameController.text;
                String password = _passwordController.text;
                _presenter.login(username, password);
              },
              child: const Text('Login'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CadastroFormPage(presenter: cadastroPresenter),
                  ),
                );
              },
              child: const Text('Criar conta'),
            ),
          ],
        ),
      ),
    );
  }

  // Quando o login for bem-sucedido, navega para a home
  @override
  void onLoginSuccess() {
    Navigator.pushReplacementNamed(context, '/home');
  }

  // Exibe mensagem de erro em caso de falha no login
  @override
  void onLoginError(String error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
  }

  @override
  void showError(String error) {
    setState(() {
      errorMessage = error;
    });
  }
}
