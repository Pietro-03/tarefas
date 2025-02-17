import 'package:flutter/material.dart';

class ToDoListPage extends StatefulWidget {
  const ToDoListPage({super.key});

  @override
  State<ToDoListPage> createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    //campo para entrada de texto
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'adicionar uma nova tarefa',
                          hintText: 'Ex. estudar...',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                            color: Colors.purple,
                            width: 2,
                          ),),
                        ),
                      ),
                    ),
                    //botão de adicionar nova tarefa
                   ElevatedButton(
                    onPressed: () {},
                    child: Icon(Icons.add),
                   ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}