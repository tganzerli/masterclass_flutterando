import '../datasources/local_todos_datasources.dart';
import '../datasources/remolte_todos_datasource.dart';
import '../models/todo_model.dart';
import '../services/check_internet_service.dart';

class TodoRepository {
  final remouteDatasource = RemouteTodosDatasource();
  final localDatasource = LocalTodosDatasource();
  final checkInternetService = CheckInternetService();

  Future<List<TodoModel>> getAllTodos() async {
    late List list;
    if (await checkInternetService.isConnected()) {
      list = await remouteDatasource.getAllTodos();
      await localDatasource.saveTodos(list);
    } else {
      list = await localDatasource.getAllTodos();
    }
    final todoList = list.map(TodoModel.fromJson).toList();
    return todoList;
  }

  void post(TodoModel todoModel) async {
    remouteDatasource.post(todoModel);
  }

  void put(TodoModel todoModel, int id) async {
    remouteDatasource.put(todoModel, id);
  }
}
