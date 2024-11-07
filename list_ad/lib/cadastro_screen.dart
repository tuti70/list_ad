import 'package:flutter/material.dart';
import 'package:lista_de_tarrefas/todo.dart';

class CadastroScreen extends StatelessWidget{
  final TextEditingController _textController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override

  Widget build(BuildContext context){
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
              padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
              child: TextFormField(
                controller: _textController,
                style: TextStyle(fontSize: 18),
                decoration: const InputDecoration(
                  labelText: "Anuncio",
                  labelStyle: TextStyle(fontSize: 18),
                ),
                validator: (value) {
                  if (value!.isEmpty){
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
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                      onPressed: (){
                        FocusScope.of(context).unfocus();
                        if (_formKey.currentState!.validate()){
                          Task newTask = Task(_textController.text);
                          Navigator.pop(context, newTask);
                        }
                      }, 
                      child: const Text(
                        "Cadastrar",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                      ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: (){
                        Navigator.pop(context, "/");
                      }, 
                      child: const Text(
                        "Cancelar",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                      ),
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