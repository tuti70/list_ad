import 'package:flutter/material.dart';
import 'package:lista_de_tarrefas/home_screen.dart';
import 'package:lista_de_tarrefas/cadastro_screen.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.purple[900],
      scaffoldBackgroundColor: Colors.grey[850],
    ),
    initialRoute: "/",
    routes:{
      "/": (context) => HomeScreen(),
      "/cadastro": (context) => CadastroScreen()
    }
  ));
}
