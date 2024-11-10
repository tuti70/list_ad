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
              title: Text(
                _lista[position].texto,
                style: TextStyle(
                  color: ads.done ? Colors.grey : Colors.white,
                  decoration: ads.done
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              subtitle: Text(_lista[position].titulo),
              trailing: Switch(
                  value: ads.done,
                  activeColor: const Color.fromARGB(255, 61, 255, 109),
                  onChanged: (bool value) {
                    setState(() {
                      ads.done = !ads.done;
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
