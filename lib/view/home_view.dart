import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../presenter/demanda_presenter.dart';
import 'package:trab_dispositivos_moveis/model/demanda_model.dart';

abstract class HomeViewContract {
  void sair();
}

class HomeView extends StatefulWidget {
  final DemandaPresenter presenter;

  HomeView({required this.presenter});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> implements HomeViewContract {
  int _selectedIndex = 0;
  late Future<List<Demanda>> _demandas;

  @override
  void initState() {
    super.initState();
    _demandas = widget.presenter.buscarDemandas();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Home')),
        body: FutureBuilder<List<Demanda>>(
          future: _demandas,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Erro ao carregar demandas'));
            }

            final demandas = snapshot.data!;

            return ListView.builder(
              itemCount: demandas.length,
              itemBuilder: (context, index) {
                final demanda = demandas[index];

                return ListTile(
                  title: Text(demanda.descricao),
                  subtitle: Text(demanda.endereco),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/cadastrarDemanda');
          },
        ),
        drawer: Drawer(
            child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Text('Menus'),
            ),
            ListTile(
              title: const Text('Perfil'),
              selected: _selectedIndex == 0,
              onTap: () {
                // Update the state of the app
                _onItemTapped(0);
                // Then close the drawer
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/perfil');
              },
            ),
            ListTile(
              title: const Text('Sair do aplicativo'),
              selected: _selectedIndex == 1,
              onTap: () {
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
            ),
          ],
        )));
  }

  @override
  void sair() {
    Navigator.pushReplacementNamed(context, '/login');
  }
}

class MenuIcon extends StatefulWidget {
  const MenuIcon({super.key});

  @override
  State<MenuIcon> createState() => _MenuIconState();
}

class _MenuIconState extends State<MenuIcon> {
  bool outlinedSelected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton.outlined(
              isSelected: outlinedSelected,
              icon: const Icon(Icons.settings_outlined),
              selectedIcon: const Icon(Icons.settings),
              onPressed: () {
                setState(() {
                  outlinedSelected = !outlinedSelected;
                });
                Scaffold.of(context).openDrawer();
              },
            ),
            const SizedBox(width: 10),
          ],
        ),
      ],
    );
  }
}
