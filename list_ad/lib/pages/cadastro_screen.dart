import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lista_de_tarrefas/todo.dart';
//Add fotos, valor, quantidade

class CadastroScreen extends StatefulWidget {
  final Ads? ads;
  const CadastroScreen({super.key, this.ads});

  @override
  State<CadastroScreen> createState() => _CadastroScreen();
}

class _CadastroScreen extends State<CadastroScreen> {
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _textController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Ads? ads;
  //File? _image;

  @override
  void initState() {
    super.initState();
    if (widget.ads != null) {
      setState(() {
        _tituloController.text = widget.ads!.titulo;
        _textController.text = widget.ads!.texto;
        ads = widget.ads;
      });
    }
  }

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
      body: Column(
        children: [
          //GestureDetector(
          //  child: Container(
          //      margin: EdgeInsets.symmetric(vertical: 20.0),
          //      width: 200,
          //      height: 200,
          //      decoration: BoxDecoration(
          //        color: Colors.grey[200],
          //        border: Border.all(width: 1, color: Colors.grey),
          //      ),
          //      child: _image == null
          //          ? Icon(Icons.add_a_photo, size: 50)
          //          : ClipPath(
          //              child: Image.file(
          //                _image!,
          //                fit: BoxFit.fill,
          //              ),
          //            )),
          //  onDoubleTap: () async {
          //    final ImagePicker _picker = ImagePicker();
          //    final XFile? pickedFile =
          //        await _picker.pickImage(source: ImageSource.camera);
          //    if (pickedFile != null) {
          //      setState(() {
          //        var _image = File(pickedFile.path);
          //      });
          //    }
          //  },
          //),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(5, 25, 5, 2.5),
                  child: Card(
                    color: const Color.fromARGB(255, 73, 73, 73),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 20),
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
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2.5, horizontal: 5),
                  child: Card(
                    color: const Color.fromARGB(255, 73, 73, 73),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 20),
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
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          height: 40,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green),
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                if (_formKey.currentState!.validate()) {
                                  Ads newTask = Ads(_textController.text,
                                      _tituloController.text);
                                  Navigator.pop(context, newTask);
                                }
                              },
                              child: Text(
                                ads != null ? "Editar" : "Cadastrar",
                                style: const TextStyle(
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
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
