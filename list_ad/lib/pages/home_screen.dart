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
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          itemCount: _lista.length,
          itemBuilder: (context, position) {
            Ads ads = _lista[position];
            return Card(
              color: const Color.fromARGB(255, 73, 73, 73),
              child: ListTile(
                onLongPress: () async {
                  showBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                  leading: const Icon(Icons.delete),
                                  title: const Text("Apagar"),
                                  onTap: () {
                                    setState(() {
                                      _lista.removeAt(position);
                                    });
                                  }),
                              ListTile(
                                leading: const Icon(Icons.edit),
                                title: const Text("Editar"),
                                onTap: () async {
                                  Navigator.pop(context);
                                  Ads editedAds = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CadastroScreen(ads: ads)));
                                  setState(() {
                                    _lista.removeAt(position);
                                    _lista.insert(position, editedAds);
                                  });
                                },
                              ),
                            ],
                          ),
                        );
                      });
                },
                title: Text(
                  _lista[position].titulo,
                  style: TextStyle(
                    color: ads.done ? Colors.white : Colors.grey,
                    decoration: ads.done
                        ? TextDecoration.none
                        : TextDecoration.lineThrough,
                  ),
                ),
                subtitle: Text(
                  _lista[position].texto,
                  style: TextStyle(
                    color: ads.done ? Colors.white : Colors.grey,
                    decoration: ads.done
                        ? TextDecoration.none
                        : TextDecoration.lineThrough,
                  ),
                ),
                trailing: Switch(
                    value: ads.done,
                    activeColor: const Color.fromARGB(255, 61, 255, 109),
                    onChanged: (bool value) {
                      setState(() {
                        ads.done = !ads.done;
                      });
                    }),
              ),
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
