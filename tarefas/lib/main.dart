import 'package:flutter/material.dart';
import 'package:tarefas/pages/todo_list_page.dart';

void main() {
  //função principal para a execução
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //definindo a tela inicial do aplicativo.
      home: ToDoListPage(),
    );
  }
}
