import 'package:flutter/material.dart';
import 'package:tarefas/models/todo.dart';
import 'package:tarefas/repositores/todo_repository.dart';
import 'package:tarefas/widgets/todo_list_item.dart';

class ToDoListPage extends StatefulWidget {
  const ToDoListPage({super.key});

  @override
  State<ToDoListPage> createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  
  //controle para o campo de texto onde o usuário
  // vai inserir a nova tarefa
  final TextEditingController todoControler = TextEditingController();

  final TodoRepository todoRepository = TodoRepository();

  List<Todo> todos = [];

  Todo? deletedTodo;
  int? deletedTodoPos;

  String? errorText;

  @override
  void initState(){
    super.initState();
    todoRepository.getTodoList().then((value) => {
      setState(() {
        todos = value;
      })
    });
  }

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
                        controller: todoControler,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'adicionar uma nova tarefa',
                          hintText: 'Ex. estudar...',
                          errorText: errorText,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.purple,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    //botão de adicionar nova tarefa
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        padding: EdgeInsets.all(10),
                      ),
                      
                      onPressed: () {
                        String text = todoControler.text;

                        if (text.isEmpty) {
                          setState(() {
                            errorText = 'o campo não pode ser vazio!';
                          });
                          return;
                        }
                        setState(() {
                          Todo newTodo = Todo(
                            title: text,
                             dateTime: DateTime.now(),
                             );
                             todos.add(newTodo);
                             errorText = null;
                        });
                        todoControler.clear();
                        todoRepository.saveTodoList(todos);
                      },

                      child: Icon(
                       Icons.add,
                       size: 35,
                      color: Colors.white,),
                    ),
                  ],
                ),

                //  lugar da listview

             Flexible(
               child: ListView(
                 shrinkWrap: true,
                 children:[
                   for (Todo todo in todos)
                     TodoListItem(
                       todo: todo,
                       onDelete: onDelete,
                     )
               
                 ],
               ),
             ),  

        Row(
          children: [
          Text(
            'você tem ${todos.length} tarefas adicionadas',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(width: 40,),
          IconButton(
          icon: Icon(
            Icons.delete_sweep,
            color: Colors.purple,
            size: 30,
          ),
          onPressed: () {},
          )
          ],
        ),



              ],   
          ),
        ),
      ),
    ),);
  }

  //função para deletar tarefa
  void onDelete (Todo todo){
    deletedTodo = todo;
    deletedTodoPos = todos.indexOf(todo);
    setState(() {
      todos.remove(todo);
    });
    todoRepository.saveTodoList(todos);
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'tarefa ${todo.title} foi removida com sucesso!',
        style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        action: SnackBarAction(
          label: 'desfazer',
          textColor: Colors.purple,
          onPressed: (){
            setState(() {
              todos.insert(deletedTodoPos!, deletedTodo!);
            });
          },
        ),
        duration: const Duration(seconds: 5),
      ),
    );
  }

void showDeleteTodoConfirmationDialog() {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Limpar tudo?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'cancelar',
            style: TextStyle(color: Colors.white),
          ),
          style: TextButton.styleFrom(
            backgroundColor: Colors.purple,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            deleteAllTodo();
          },
          child: Text(
            'limpar tudo',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          style:TextButton.styleFrom(
            backgroundColor: Colors.purple,
          )
        ),
      ],
    ),
  );
}

void deleteAllTodo(){
  setState(() {
    todos.clear();
  });
  todoRepository.saveTodoList(todos);
}

}
