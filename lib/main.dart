import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyHomePage()));
}

class MyHomePage extends StatefulWidget{
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();  
}

class _MyHomePageState extends State<MyHomePage>{

  //init variable.
  final List<String> _todos = ['task 1','task 2','task 3','task 4'];

  void _addTodo(){
    showDialog(
      context: context,
      builder:(BuildContext context){
        String newTodo = '';
        return AlertDialog(
          title:const Text('Enter new task below.'),
          content: TextField(
            onChanged: (value){
              newTodo = value;
            }
          ),
          actions: <Widget>[
            TextButton(
              onPressed: (){Navigator.of(context).pop();},
              child:const Text('Cancel')),
            TextButton(
              onPressed: (){
                setState((){_todos.add(newTodo);});
                Navigator.of(context).pop();
                },
              child:const Text('Add'))
          ],
        );

      }
      );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('To Do List'),),
      body: ListView.builder(
        itemCount: _todos.length,
        itemBuilder: (context,index){
          final todo = _todos[index];

          return ListTile(
            title: Text(todo),
            onTap: (){
              setState((){
                _todos.removeAt(index);

               },
              );
            }
          );
        }
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add), onPressed: _addTodo),
    );
  }
}