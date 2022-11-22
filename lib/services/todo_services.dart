

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:provider_pack_task/pages/model/todo_model.dart';
class TodoService{
  Future<List<Todo>> getAll()async{
    const url="https://jsonplaceholder.typicode.com/todos";

    final uri=Uri.parse(url);
    final response=await http.get(uri);
    if(response.statusCode==200){
      final json=jsonDecode(response.body) as List ;


      final todos=json.map((e){
        return Todo(
            title: e["title"],
            id: e['id'],
            isCompleste: e['completed'],
            userId: e['userId']);
      }).toList();
      return todos;

    }
    return [];

   // throw    "SomeThing wrong";

  }
}