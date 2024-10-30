import 'package:flutter/material.dart';
import 'view/login_view.dart';
import 'view/cadastro_view.dart';
import 'view/home_view.dart';
import 'view/perfil_view.dart';
import 'view/demanda_view.dart';
import '../dao/demanda_dao.dart';
import '../presenter/demanda_presenter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final demandaDao = DemandaDao.instance;
  final demandaPresenter = DemandaPresenter(demandaDao);
  runApp(MyApp(demandaPresenter: demandaPresenter));
}

class MyApp extends StatelessWidget {
  final DemandaPresenter demandaPresenter;

  MyApp({required this.demandaPresenter});

  // This widget is the root of your application.
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
        '/login': (context) => const LoginView(),
        '/cadastro': (context) => const CadastroView(),
        '/home': (context) => const HomeView(),
        '/perfil': (context) => const PerfilView(),
        '/cadastrarDemanda': (context) => DemandaView(
              presenter: demandaPresenter,
            ),
      },
    );
  }
}
