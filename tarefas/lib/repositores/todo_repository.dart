

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tarefas/models/todo.dart';

const todoListKey = 'todo_list';

class TodoRepository{

  //utilizado para armazenar a lista de tarefas 
  // no sharedpreferences
  late SharedPreferences sharedPreferences;

  // Função assincrona para obter a lista de tarefas no SharedPreferences
  Future<List<Todo>> getTodoList() async{

    sharedPreferences = await SharedPreferences.getInstance();

    final String jsonString = sharedPreferences.getString(todoListKey) ?? '[]';

    final List jsonDecoded = json.decode(jsonString) as List;

    return jsonDecoded.map((e) => Todo.fromJson(e)).toList();

  }

  void saveTodoList(List<Todo> todos){
    final String jsonString = json.encode(todos);

    sharedPreferences.setString(todoListKey, jsonString);
    
  }

}