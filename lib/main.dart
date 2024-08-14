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
  final List<String> _todos = ['task 1','task 2','task 3'];

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
}