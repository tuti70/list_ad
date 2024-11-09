import 'package:flutter/material.dart';
import 'package:lista_de_tarrefas/pages/cadastro_screen.dart';
import 'package:lista_de_tarrefas/todo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Ads> _lista = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text(
            "App ADS",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: _lista.length,
          itemBuilder: (context, position) {
            Ads ads = _lista[position];
            return ListTile(
              tileColor: Colors.white,
              title: Text(_lista[position].texto),
              subtitle: Text(_lista[position].titulo),
              shape: Border.symmetric(ver),
              trailing: Switch(
                  value: ads.done,
                  activeColor: const Color.fromARGB(255, 52, 158, 58),
                  onChanged: (bool value) {
                    setState(() {
                      ads.done = value;
                    });
                  }),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(Icons.add),
          onPressed: () async {
            try {
              Ads newAds = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CadastroScreen()));
              setState(() {
                _lista.add(newAds);
              });
            } catch (erro) {
              print("Erro: ${erro.toString()}");
            }
          },
        ));
  }
}
