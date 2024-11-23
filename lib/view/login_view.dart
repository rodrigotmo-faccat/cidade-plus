import 'package:flutter/material.dart';
import 'package:trab_dispositivos_moveis/view/home_page.dart';
import '../presenter/login_presenter.dart';

class LoginView extends StatelessWidget {
  final LoginPresenter presenter;

  LoginView({Key? key, required this.presenter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(0, 100, 0, 0),
              height: 200.0,
              width: 200.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: const DecorationImage(
                  image: AssetImage("assets/logo.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton.icon(
              onPressed: () async {
                bool success = await presenter.signInWithGoogle();
                if (success) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Login falhou!")),
                  );
                }
              },
              icon: Image.asset(
                'assets/google_icon.png',
                height: 24,
                width: 24,
              ),
              label: Text("Entrar com conta Google"),
            ),
          ],
        ),
      ),
    );
  }
}
