import 'package:flutter/material.dart';
import '../models/todo_model.dart';
import '../repositories/todo_repository.dart';

class TodoStore extends ChangeNotifier {
  TodoRepository todoRepository = TodoRepository();
  List<TodoModel> _todoAll = [];
  List<TodoModel> _todo = [];
  List<TodoModel> _wasDone = [];
  bool _buttonTodoWasSelected = true;
  String _newTodo = '';

  getTodoAllList() {
    return _todoAll;
  }

  getTodoLis() {
    return _todo;
  }

  getWasDoneLis() {
    return _wasDone;
  }

  getButtonTodoWasSelected() {
    return _buttonTodoWasSelected;
  }

  setNewTodo(text) {
    _newTodo = text;
  }

  Future<void> getAllTodos() async {
    _todoAll = await todoRepository.getAllTodos();
    for (var element in _todoAll) {
      if (element.isChecked) {
        _wasDone.add(element);
      } else {
        _todo.add(element);
      }
    }
    notifyListeners();
  }

  chengeItem(int index, int id, String title, bool isChecked) async {
    TodoModel todoModel = TodoModel(id: id, title: title, isChecked: isChecked);
    todoRepository.put(todoModel, id);
    if (_buttonTodoWasSelected) {
      _todo.removeAt(index);
      _wasDone.add(todoModel);
    } else {
      _wasDone.removeAt(index);
      _todo.add(todoModel);
    }
    int _index = 0;
    for (var element in _todoAll) {
      if (element.id == id) {
        _todoAll[_index] = todoModel;
      }
      _index++;
    }
    notifyListeners();
  }

  chengeList() {
    _buttonTodoWasSelected = !_buttonTodoWasSelected;
    notifyListeners();
  }

  void addTodo() {
    TodoModel todoModel = TodoModel(id: 0, title: _newTodo, isChecked: false);
    todoRepository.post(todoModel);
    getAllTodos();
    _todoAll = [];
    notifyListeners();
  }
}
