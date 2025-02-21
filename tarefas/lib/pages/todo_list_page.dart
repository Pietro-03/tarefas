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
                      
                      onPressed: () {},
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
                  Text('estudar'),
                  Text('jogar'),
                  Text('academia'),
                  Text('senai'),
               
                 ],
               ),
             ),  

        Row(
          children: [
          Text(
            'você tem 0 tarefas adicionadas',
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
}
