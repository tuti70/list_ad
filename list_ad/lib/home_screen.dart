import 'package:flutter/material.dart';
import 'package:lista_de_tarrefas/cadastro_screen.dart';
import 'package:lista_de_tarrefas/todo.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> _lista = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text(
            "App tarerefas",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: ListView.separated(
          itemCount: _lista.length,
          itemBuilder: (context, position){
            return ListTile(title: Text(_lista[position].texto));
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(), 
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(Icons.add),
          onPressed: () async {
            try {
              Task newTask = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CadastroScreen()));
                setState(() {
                  _lista.add(newTask);
                });
            } catch (erro) {
              var error;
              print("Erro: ${error.toString()}");
            }
          },
        ));
  }
}
