import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:tarefas/models/todo.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({super.key, required this.todo, 
    required this.onDelete,
  });

  final Todo todo;
  final Function onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 2,
      ),
      child: Slidable(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey[200],
          ),
          padding: const EdgeInsets.all(10),
          height: 60,


          //conteúdo da tarefa
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // exibe a data e hora
              Text(
                DateFormat('dd/mm/yyy - HH:mm').format(todo.dateTime),
                style: TextStyle(fontSize: 12),
              ),
            // exibe o titulo da tarefa
            Text(
              todo.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              )
            )

            ],
          ),
        ),

        //definindo a ação do botão de exclusão
        endActionPane: ActionPane(
          motion: const DrawerMotion(),
          extentRatio: 0.25,
          children: [
            SlidableAction(
              label: 'deletar',
              backgroundColor: Colors.red,
              icon: Icons.delete,
              onPressed: (context) {
                onDelete(todo);
              },
            ),
          ],
          ),
      ),
    );
  }
}