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
              onLongPress: () async {
                showBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                                leading: Icon(Icons.delete),
                                title: Text("Apagar"),
                                onTap: () {
                                  setState(() {
                                    _lista.removeAt(position);
                                  });
                                }),
                            ListTile(
                              leading: Icon(Icons.edit),
                              title: Text("Editar"),
                              onTap: () async {
                                Navigator.pop(context);
                                Ads editedAds = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CadastroScreen(ads: ads)));
                                if (editedAds != null) {
                                  setState(() {
                                    _lista.removeAt(position);
                                    _lista.insert(position, editedAds);
                                  });
                                }
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
              subtitle: Text(_lista[position].texto),
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
