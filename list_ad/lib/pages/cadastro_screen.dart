import 'package:flutter/material.dart';
import 'package:lista_de_tarrefas/todo.dart';
//Add fotos, valor, quantidade

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  State<CadastroScreen> createState() => _CadastroScreen();
}

class _CadastroScreen extends State<CadastroScreen> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _tituloController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          "Cadastro de terefa",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: TextFormField(
                controller: _tituloController,
                style: const TextStyle(fontSize: 18),
                decoration: const InputDecoration(
                  labelText: "Titulo",
                  labelStyle: TextStyle(fontSize: 18),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Prenchimento Obrigatório";
                  }
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: TextFormField(
                controller: _textController,
                style: const TextStyle(fontSize: 18),
                decoration: const InputDecoration(
                  labelText: "Descrição",
                  labelStyle: TextStyle(fontSize: 18),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Prenchimento Obrigatório";
                  }
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 40,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          if (_formKey.currentState!.validate()) {
                            Ads newTask = Ads(
                                _textController.text, _tituloController.text);
                            Navigator.pop(context, newTask);
                          }
                        },
                        child: const Text(
                          "Cadastrar",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 40,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        onPressed: () {
                          Navigator.pop(context, "/");
                        },
                        child: const Text(
                          "Cancelar",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
