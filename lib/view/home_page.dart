import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trab_dispositivos_moveis/model/demanda_model.dart';
import 'package:trab_dispositivos_moveis/presenter/demanda_presenter.dart';
import 'package:trab_dispositivos_moveis/presenter/home_presenter.dart';
import 'package:trab_dispositivos_moveis/view/demanda_form_page.dart';
import 'package:trab_dispositivos_moveis/view/demanda_view.dart';
import 'package:trab_dispositivos_moveis/view/home_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> implements HomeView, DemandaView {
  int _selectedIndex = 0;
  late DemandaPresenter presenter;

  List<Demanda> demandas = [];
  String errorMessage = '';

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    presenter = DemandaPresenter(this);
    presenter.fetchDemandasFirebase();
  }

  @override
  void displayDemandas(List<Demanda> demandas) {
    setState(() {
      this.demandas = demandas;
      errorMessage = '';
    });
  }

  @override
  void showError(String error) {
    setState(() {
      errorMessage = error;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text(
            'Olá, Rodrigo',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            bool? demandaAdicionada = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DemandaFormPage(presenter: presenter),
              ),
            );

            if (demandaAdicionada == true) {
              presenter.fetchDemandasFirebase();
            }
          },
        ),
        backgroundColor: Colors.white,
        body: errorMessage.isEmpty
            ? ListView.builder(
                itemCount: demandas.length,
                itemBuilder: (context, index) {
                  return Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      elevation: 3, // Elevação para dar profundidade aos cards
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            15), // Bordas arredondadas no estilo moderno
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            contentPadding: const EdgeInsets.all(16),
                            leading: CircleAvatar(
                              backgroundColor: Colors.blueAccent,
                              child: Text(
                                demandas[index].categoria[0],
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            title: Text(
                              demandas[index].descricao,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            subtitle: Text(
                              'Categoria: ${demandas[index].categoria}',
                              style: const TextStyle(color: Colors.black54),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.settings)),
                                IconButton(
                                    onPressed: () async {
                                      await presenter.deleteDemandaFirebase(
                                          demandas[index].id);

                                      presenter.fetchDemandasFirebase();
                                    },
                                    icon: const Icon(Icons.delete,
                                        color: Colors.red))
                              ],
                            ),
                          ),
                        ],
                      ));
                },
              )
            : Center(
                child: Text(
                  errorMessage,
                  style: const TextStyle(color: Colors.redAccent),
                ),
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
