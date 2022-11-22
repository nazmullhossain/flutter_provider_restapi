import 'package:flutter/cupertino.dart';
import 'package:provider_pack_task/services/todo_services.dart';

import '../pages/model/todo_model.dart';

class TodoProvider extends ChangeNotifier{
bool isLoading=false;
final _service=TodoService();
List<Todo> _todos=[];
List<Todo> get todos=>_todos;
Future<void>getAllTodos()async{

  notifyListeners();
  final response= await _service.getAll();
  _todos=response;
  isLoading=false;
  notifyListeners();


}
}