import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trab_dispositivos_moveis/firebase_options.dart';
import 'package:trab_dispositivos_moveis/presenter/login_presenter.dart';
import 'package:trab_dispositivos_moveis/view/home_page.dart';
import 'view/login_view.dart';
import 'view/perfil_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Cidadão',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginView(
              presenter: LoginPresenter(),
            ),
        '/home': (context) => HomePage(),
        '/perfil': (context) => const PerfilView(),
      },
    );
  }
}
